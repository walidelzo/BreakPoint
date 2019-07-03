//
//  DataService.swift
//  BreakPoint
//
//  Created by Admin on 7/3/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import Foundation
import Firebase
let DB_REF = Database.database().reference()

class DataService{
    static let instance = DataService()
    
    //private variables
    var _REF_DATABASE = DB_REF
    var _REF_USERS = DB_REF.child("users")
    var _REF_GROUPS = DB_REF.child("groups")
    var _REF_FEEDS = DB_REF.child("feed")
    
    //public variables
    var REF_DB :DatabaseReference {
        return _REF_DATABASE
    }
    var REF_USERS :DatabaseReference{
        return _REF_USERS
    }
    var REF_GROUPS:DatabaseReference {
        return _REF_GROUPS
    }
    var REF_FEEDS:DatabaseReference{
        return _REF_FEEDS
    }
    
    //create user function
    func createUser(forId uid:String ,AndUserData userData:Dictionary<String,Any>){
        REF_DB.child(uid).updateChildValues(userData)
    }
    
    
    
    
}
