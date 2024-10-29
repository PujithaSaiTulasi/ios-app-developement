//
//  ViewController.swift
//  WA6_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/22/24.

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    let notificationCenter = NotificationCenter.default
    
    var contactNames = [String]()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.separatorStyle = .none
        
        notificationCenter.addObserver(self, selector: #selector(reloadContacts(notification:)), name: .contactListUpdated, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleContactDeletion(notification:)), name: .contactDeleted, object: nil)

        getAllContacts()
       
        mainScreen.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    @objc func handleContactDeletion(notification: Notification) {
        guard let deletedContactName = notification.object as? String else { return }
        
        if let index = contactNames.firstIndex(of: deletedContactName) {
            self.contactNames.remove(at: index)
            self.mainScreen.tableViewContacts.reloadData()
        }
    }

    @objc func reloadContacts(notification: Notification) {
        getAllContacts()
    }
    
    @objc func onButtonAddTapped(){
        
        let name = mainScreen.textFieldAddName.text ?? ""
        let email = mainScreen.textFieldAddEmail.text ?? ""
        let phoneNumberText = mainScreen.textFieldAddPhone.text ?? ""
        let phoneNumber = Int(phoneNumberText) ?? 0
       
        if name.isEmpty {
           showAlert(title: "Missing Name", message: "Please enter your name.")
           return
        }

        if email.isEmpty {
           showAlert(title: "Missing Email", message: "Please enter your email address.")
           return
        }
       
        if phoneNumberText.isEmpty {
           showAlert(title: "Missing Phone Number", message: "Please enter your phone number.")
           return
        }
       
        if !isValidEmail(email) {
           showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
           return
        }
       
        if !isValidPhoneNumber(phoneNumberText) {
           showAlert(title: "Invalid Phone Number", message: "Please enter a valid phone number.")
           return
        }
        
        let contact = Contact(name: name, email: email, phone: phoneNumber)
        addANewContact(contact: contact)
        
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
            
        func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            let phoneRegEx = "^[0-9]{10}$"
            let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
            return phonePred.evaluate(with: phoneNumber)
        }
    }
    
    func clearAddViewFields(){
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }
    
    func openContactDetailScreen(data: String){
        let parts = data.components(separatedBy: ",")
        print(parts)
        
        let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
        let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
        if let phone = Int(parts[2].trimmingCharacters(in: .whitespacesAndNewlines)){
        
        let contact =   Contact(name: name, email: email, phone: phone)
        let contactDetailScreen = DisplayContactDetailsViewController()
        contactDetailScreen.contact = contact
        navigationController?.pushViewController(contactDetailScreen, animated: true)
        }
        
    }
    
    func addANewContact(contact: Contact){
        if let url = URL(string: APIConfigs.baseURL+"add"){
            
            AF.request(url, method:.post, parameters:
                        [
                            "name": contact.name,
                            "email": contact.email,
                            "phone": contact.phone
                        ])
                .responseString(completionHandler: { response in
                   
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                self.getAllContacts()
                                self.clearAddViewFields()
                                    break
                        
                                case 400...499:
                                    print(data)
                                    break
                        
                                default:
                                    print(data)
                                    break
                            }
                        }
                        break
                        
                    case .failure(let error):
                        print(error)
                        break
                    }
                })
        }else{
            self.showAlert(title: "Error", message: "The URL provided is invalid.")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                                let names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.mainScreen.tableViewContacts.reloadData()
                                print(self.contactNames)
                                break
                    
                            case 400...499:
                                print(data)
                                break
                    
                            default:
                                print(data)
                                break
                        }
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }
    
    func getContactDetails(name: String){
        if let url = URL(string: APIConfigs.baseURL+"details"){
            AF.request(url, method:.get,
                       parameters: ["name":name],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
            
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                                self.openContactDetailScreen(data: data)
                                break
                    
                            case 400...499:
                                print(data)
                                break
                    
                            default:
                                print(data)
                                break
                        }
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getContactDetails(name: self.contactNames[indexPath.row])
    }
}

