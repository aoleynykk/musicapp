//
//  NewAccountViewController.swift
//  musicapp
//
//  Created by Олександр Олійник on 20.07.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class NewAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    //MARK: - Actions
    @IBAction func createButtonPressed(_ sender: Any) {
        if checkValid(arr: [emailTextField, passwordTextField]) != nil {
            let alertController = UIAlertController(title: "Error", message: checkValid(arr: [emailTextField, passwordTextField]), preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { _ in }
            alertController.addAction(action)
            self.present(alertController, animated: true)
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result,error)  in
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: [
                    "name": self.nameTextField.text!,
                    "email": self.emailTextField.text!,
                    "uid": result!.user.uid
                ])
            }
            guard let controller = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? UIViewController else { return }
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true)
        }
        
    }
    
//    @IBAction func signInButtonPressed(_ sender: Any) {
//        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? UIViewController else { return }
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        present(controller, animated: true)
//    }
}
