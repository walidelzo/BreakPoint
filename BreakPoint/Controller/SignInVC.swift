//
//  SignInVC.swift
//  BreakPoint
//
//  Created by walid elzo on 1/19/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit
class SignInVC: UIViewController {
    //OutLets
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passWordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var messageLabel: RoundLabelView!
    
    override func viewDidLoad() {
        messageLabel.isHidden = true
        super.viewDidLoad()
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(dismissTap)
    }
    
   @objc func dismissKeyBoard() {
        self.view.endEditing(true);
    }
    func checker()->Bool {
        let email = emailTextField.text
        let password = passWordTextField.text
        let confirmPass = confirmPasswordTextField.text
        messageLabel.isHidden = true

        if email == "" || password == "" || confirmPass == "" {
            messageLabel.isHidden = false
            messageLabel.text = "📩 enter user name or password"
            return false}
            
        if password != confirmPass {
            messageLabel.isHidden = false
            messageLabel.text = "📩 password and conform password not equal"
            return false}
        if password!.count < 7 || confirmPass!.count < 7 {
            messageLabel.isHidden = false
            messageLabel.text = "📩 the password must be more than 7 characters or numbers."
            return false}
            
        if email?.isEmail() == false {
            messageLabel.isHidden = false
            messageLabel.text = "📩 enter a valid email address"
            return false}
        
        return true
    }
    
    @IBAction func signInButtonPressedAction(_ sender: Any) {
        if checker() {
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passWordTextField.text!) { (loginSucccess, loginError) in
                if loginSucccess {
                   // self.dismiss(animated: true, completion: nil)
                    print("the login succ..")
                    let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "MainScreen")
                    self.present(signInVC!, animated: true, completion: nil)
                    
                } else {
                    print(String(describing: loginError!.localizedDescription))
                    let theUserNoFound = "There is no user record corresponding to this identifier. The user may have been deleted."
                    if (loginError!.localizedDescription == theUserNoFound) {
//                        self.messageLabel.text! = "✉️ No user Found"
//                        self.messageLabel.isHidden = false
                        
                        
                        AuthService.instance.createUser(withEmail: self.emailTextField.text!, andPassword: self.passWordTextField.text!) { (createUserSucess, creatError) in
                                       if createUserSucess {
                                           AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passWordTextField.text!) { (logSuccess, logError) in
                                               if (logSuccess) {
                                                   print("the user is created sucessfully")
                                               }else {
                                                   print(String(describing: logError))
                                               }
                                           }
                                           
                                       }else {
                                           print(String(describing: creatError))
                                       }
                                   }
                                   
                        
                        //////
                    }
                }
            }
          
            /// register user if not
                 
        }
    }
    
    @IBAction func closeTheScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
