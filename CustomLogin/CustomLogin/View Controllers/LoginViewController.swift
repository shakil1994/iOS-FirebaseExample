//
//  LoginViewController.swift
//  CustomLogin
//
//  Created by Md Kamrul Hasan on 17/3/20.
//  Copyright © 2020 Md Kamrul Hasan. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        /*Hide the error label*/
        errorLabel.alpha = 0
        
        /*Style the elements*/
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFieldButton(loginButton)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        /*Validate test Fields*/
//        let error = validateFields()
//
//        if error != nil {
//            /*There's something wrong with the fields, show error message*/
//            showError(error!)
//        }
//        else {
//            /*Create cleaned versions of the data*/
//
//            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            /*Signing in the user*/
//            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//                if error != nil {
//                    /*Couldn't sign in */
//                    self.showError(error!.localizedDescription)
//                }
//                else {
//                    self.transitionToHome()
//                }
//            }
//        }
        
        
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func validateFields() -> String? {
        
        /*Check that all fields are filled in*/
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        /*Check it the password is secure*/
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            /*Password isn't secure enough*/
            
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        
        return nil
    }
    
}
