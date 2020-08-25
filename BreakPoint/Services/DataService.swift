//
//  DataService.swift
//  BreakPoint
//
//  Created by Admin on 7/3/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import Foundation
import Firebase

//create a singleton class to manage connection to firebase and create the users
//,groups and feeds.

let DB_REF = Database.database().reference()

class DataService{
    static let instance = DataService()
    
    //private variables
    private var _REF_DATABASE = DB_REF
    private var _REF_USERS = DB_REF.child("users")
    private var _REF_GROUPS = DB_REF.child("groups")
    private var _REF_FEEDS = DB_REF.child("feed")
    
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
    
    func createUser(forId uid:String ,AndUserData userData:Dictionary<String,Any>)
    {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func WriteANewPost (withMessage message :String ,AndSenderID senderID :String ,groupID :String? , completion:@escaping (_ theMessageWasSent: Bool)->() ) {
        if groupID != nil{
            //code here 
        }else {
            _REF_FEEDS.childByAutoId().updateChildValues(["message" : message , "senderID" :senderID ])
            completion(true)
        }
        
    }
    
}
