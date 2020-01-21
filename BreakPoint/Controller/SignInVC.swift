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
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError!.localizedDescription))
                }
            }
            
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
            
            
            
        }
    }
    
    @IBAction func closeTheScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
