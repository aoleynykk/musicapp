//
//  SignInViewController.swift
//  musicapp
//
//  Created by Олександр Олійник on 20.07.2022.
//

import UIKit
import Firebase
import FirebaseAuth


class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    //MARK: - Actions
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                let alertController = UIAlertController(title: "Warning!", message: "Incorrect data entered", preferredStyle: .alert)
                let action = UIAlertAction(title: "Try again", style: .default) { _ in }
                alertController.addAction(action)
                self.clearTextFields(textFields: [self.emailTextField, self.passwordTextField])
                self.present(alertController, animated: true)
            } else {
                guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? UIViewController else { return }
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .crossDissolve
                self.present(controller, animated: true)
            }
        }
    }
    
    private func clearTextFields(textFields: [UITextField]) {
        for textField in textFields {
            textField.text = ""
        }
    }
    //    @IBAction func restoreButtonPressed(_ sender: Any) {
//        guard let controller = storyboard?.instantiateViewController(withIdentifier: "RestoreAccountViewController") as? UIViewController else { return }
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        navigationController?.show(controller, sender: nil)
//    }
//    
//    @IBAction func newAccountButtonPressed(_ sender: Any) {
//        guard let controller = storyboard?.instantiateViewController(withIdentifier: "NewAccountViewController") as? UIViewController else { return }
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        show(controller, sender: nil)
    
}
