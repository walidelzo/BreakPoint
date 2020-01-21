//
//  AuthVC.swift
//  BreakPoint
//
//  Created by walid elzo on 1/19/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginWithFBButtonPressed(_ sender: Any) {
    }
    
    @IBAction func loginWithGoogleButtonPressed(_ sender: Any) {
    }
    @IBAction func AuthByEmailButtonPressed(_ sender: Any) {
        let signInVC = storyboard?.instantiateViewController(withIdentifier: "SignInVC")
        present(signInVC!, animated: true, completion: nil)
    }
    
}
