//
//  ProfileScreenViewController.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/25/24.
//

import UIKit

class ProfileScreenViewController: UIViewController {

    let profileScreen = ProfileScreenView()
    
    override func loadView() {
        view = profileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "My Profile"
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) ]
        
        navigationItem.hidesBackButton = true
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(onCloseTapped))
        navigationItem.leftBarButtonItem = closeButton
        
        if let token = APIService.getToken() {
            fetchUserProfile(token: token)
        } else {
            print("No token found. User might not be logged in.")
        }
        
        profileScreen.buttonLogout.addTarget(self, action: #selector(onButtonLogoutTapped), for: .touchUpInside)
    }
    
    @objc func onCloseTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func fetchUserProfile(token: String) {
        APIService.getProfile(token: token) { result in
            switch result {
            case .success(let userProfile):
                DispatchQueue.main.async {
                    self.profileScreen.labelName.text = userProfile.name
                    self.profileScreen.labelEmail.text = userProfile.email
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert("Error", "Failed to fetch profile: \(error.localizedDescription)")
                }
            }
        }
    }

    @objc func onButtonLogoutTapped() {
        APIService.removeToken()
        
        let loginViewController = ViewController()
            
        let navController = UINavigationController(rootViewController: loginViewController)

        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
