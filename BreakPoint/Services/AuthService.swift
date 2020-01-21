//
//  AuthService.swift
//  BreakPoint
//
//  Created by walid elzo on 1/20/20.
//  Copyright © 2020 NanoSoft. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let  instance = AuthService()
    
    func createUser(withEmail email:String ,andPassword passWord: String ,userCreationCompletion : @escaping (_ status :Bool ,_ error :Error? )->()) {
        Auth.auth().createUser(withEmail: email, password: passWord) { (user, error) in
            guard let user = user else {
                userCreationCompletion(false,error!)
                return
            }
            let userData = ["provider" : user.user.providerID , "email" : user.user.email]
            print(".....\(String(describing: user.additionalUserInfo!.providerID))...........")
            DataService.instance.createUser(forId: user.user.uid, AndUserData: userData as Dictionary<String, Any>)
            userCreationCompletion(true,nil)
        }
    }
    
    func loginUser(withEmail email:String , andPassword passWord :String , userLoginSuccess :@escaping (_ Status:Bool , _ error:Error?)->()) {
        Auth.auth().signIn(withEmail: email, password: passWord) { (user, errorFire) in
            if errorFire != nil {
                userLoginSuccess(false,errorFire)
                return
            }
          userLoginSuccess(true , nil)
        }
        
    }
}
