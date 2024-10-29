//
//  ViewController.swift
//  WA7_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 10/24/24.
//

import UIKit

class ViewController: UIViewController {

    let loginScreen = LoginScreenView()
    
    override func loadView() {
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if let token = APIService.getToken(), !token.isEmpty {
            
            navigateToNotesScreen()
            
        } else {
            
            loginScreen.notesImage.image = UIImage(named: "notes.png")
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
            tapRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapRecognizer)
            
            loginScreen.buttonRegister.addTarget(self, action: #selector(onButtonRegisterTapped), for: .touchUpInside)
            loginScreen.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
            
        }
  
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    @objc func onButtonRegisterTapped() {
        let registerScreenController = SignupScreenViewController()
        navigationController?.pushViewController(registerScreenController, animated: true)
    }
    
    @objc func onButtonLoginTapped() {
        
        let email = loginScreen.textFieldEmail.text ?? ""
        let password = loginScreen.textFieldPassword.text ?? ""
        
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
        
        APIService.loginUser(email: email, password: password) { result in
            switch result {
            case .success(let token):
                print("Login successful, token: \(token)")
                APIService.saveToken(token: token)
                self.navigateToNotesScreen()
            case .failure(let error):
                if error.localizedDescription.contains("No user found.") {
                    self.showAlert("Login Failed", "User not found. Please register first.")
                }else {
                    self.showAlert("Login Failed", "Incorrect password")
                }
            }
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func navigateToNotesScreen() {
        let notesScreen = NotesScreenViewController()
        let navigationController = UINavigationController(rootViewController: notesScreen)
                
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            guard let window = scene.windows.first else { return }
            window.rootViewController = navigationController
            
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
