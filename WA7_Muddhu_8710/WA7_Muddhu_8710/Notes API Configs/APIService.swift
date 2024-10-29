//
//  APIService.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import Foundation
import Alamofire

class APIService{
    
    static func registerUser(user: User, completion: @escaping (Result<String, Error>) -> Void){
        
        if let url = URL(string: APIConfigs.baseAuthURL+"register"){
            
            let parameters: [String: String] = [
                "name": user.name,
                "email": user.email,
                "password": user.password
            ]
            
            AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: AuthResponse.self) { response in
                switch response.result {
                case .success(let authResponse):
                    if authResponse.auth, let token = authResponse.token  {
                        completion(.success(token))
                    } else {
                        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Authentication failed"])))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
    }

    static func loginUser(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        if let url = URL(string: APIConfigs.baseAuthURL + "login") {
            
            let parameters: [String: String] = [
                "email": email,
                "password": password
            ]
            
            AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default)
                .responseData { response in

                let statusCode = response.response?.statusCode
                
                switch response.result {
                case .success(let data):
                    
                    if let uwStatusCode = statusCode {
                        switch uwStatusCode {
                        case 200...299:
                            let decoder = JSONDecoder()
                            do {
                                let authResponse = try decoder.decode(AuthResponse.self, from: data)
                                
                                if authResponse.auth, let token = authResponse.token {
                                    completion(.success(token))
                                } else {
                                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Authentication failed. Invalid credentials."])))
                                }
                            } catch {
                                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "JSON decoding failed."])))
                            }
                            
                        case 400...499:
                            if let errorMessage = String(data: data, encoding: .utf8) {
                                completion(.failure(NSError(domain: "", code: uwStatusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])))
                            }
                            
                        default:
                            completion(.failure(NSError(domain: "", code: uwStatusCode, userInfo: [NSLocalizedDescriptionKey: "Unexpected server error."])))
                        }
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
 

    static func getProfile(token: String, completion: @escaping (Result<UserProfile, Error>) -> Void){
        
        if let url = URL(string: APIConfigs.baseAuthURL+"me"){
            
            let headers: HTTPHeaders = [
                "x-access-token": token
            ]
            
            AF.request(url, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: UserProfile.self) { response in
                switch response.result {
                case .success(let userProfile):
                    completion(.success(userProfile))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
    }
    
    
    static func getAllNotes(token: String, completion: @escaping (Result<[Note], Error>) -> Void){
        
        if let url = URL(string: APIConfigs.baseNoteURL+"getall"){
            
            let headers: HTTPHeaders = [
                "x-access-token": token
            ]
            
            AF.request(url, method: .get, headers: headers)
                .validate()
                .responseDecodable(of: GetAllNotesResponse.self) { response in
                    switch response.result {
                    case .success(let notesResponse):
                        completion(.success(notesResponse.notes))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
        
    }
    
    
    static func addNote(token: String, text: String, completion: @escaping (Result<Note, Error>) -> Void){
        
        if let url = URL(string: APIConfigs.baseNoteURL+"post"){
            
            let parameters: [String: String] = [
                "text": text
            ]
            
            let headers: HTTPHeaders = [
                "x-access-token": token
            ]
            
            AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: AddNoteResponse.self) { response in
                switch response.result {
                case .success(let addNoteResponse):
                    completion(.success(addNoteResponse.note))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
    }
    
    
    static func deleteNote(token: String, noteId: String, completion: @escaping (Result<String, Error>) -> Void){
        
        if let url = URL(string: APIConfigs.baseNoteURL+"delete"){
            
            let parameters: [String: String] = [
                "id": noteId
            ]
            
            let headers: HTTPHeaders = [
                "x-access-token": token
            ]
            
            AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: DeleteNoteResponse.self) { response in
                switch response.result {
                case .success(let deleteNoteResponse):
                    completion(.success(String(deleteNoteResponse.delete)))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
    }
    
    static func saveToken(token: String) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "authToken")
        defaults.synchronize()
    }
    
    static func getToken() -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "authToken")
    }

    static func removeToken() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "authToken")
        defaults.synchronize()
    }
    
}
