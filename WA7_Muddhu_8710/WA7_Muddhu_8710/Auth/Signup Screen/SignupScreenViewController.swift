//
//  SignupScreenViewController.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class SignupScreenViewController: UIViewController {

    let signupScreen = SignupScreenView()
    
    override func loadView() {
        view = signupScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        signupScreen.notesImage.image = UIImage(named: "notes.png")
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        signupScreen.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        signupScreen.buttonRegister.addTarget(self, action: #selector(onButtonRegisterTapped), for: .touchUpInside)
    }
    
    @objc func onButtonLoginTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    @objc func onButtonRegisterTapped() {
        
        let name = signupScreen.textFieldName.text ?? ""
        let email = signupScreen.textFieldEmail.text ?? ""
        let password = signupScreen.textFieldPassword.text ?? ""
        
        if name.isEmpty {
           showAlert("Missing Name", "Please enter your name.")
           return
        }

        if email.isEmpty {
           showAlert("Missing Email", "Please enter your email address.")
           return
        }
       
        if password.isEmpty {
           showAlert("Missing Password", "Please enter your password.")
           return
        }
        
        if !isValidEmail(email) {
           showAlert("Invalid Email", "Please enter a valid email address.")
           return
        }
        
        
        let user = User(name: name, email: email, password: password)
        
        APIService.registerUser(user : user){ result in
            switch result {
            case .success(let token):
                print("Registration successful, token: \(token)")
                APIService.saveToken(token: token)
                self.navigateToLoginScreen()
            case .failure(_):
                self.showAlert("Registration Failed", "User with this username/email already exists.")
            }
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func navigateToLoginScreen(){
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
