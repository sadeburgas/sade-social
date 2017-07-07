//
//  DataService.swift
//  sade-social
//
//  Created by sade on 7/7/17.
//  Copyright © 2017 sade. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference() //url the root of db
let STORAGE_BASE = Storage.storage().reference()

class DataService {
    
    static let ds = DataService() //create the single instance
    
    //DB Reference
    private var _REF_BASE = DB_BASE
    private var _REF_POST = DB_BASE.child("post")
    private var _REF_USERS = DB_BASE.child("USERS")
    
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POST: DatabaseReference {
        return _REF_POST
    }
    
    var REF_USERS:DatabaseReference {
        return _REF_USERS
    }
    
    func createFirebasseDBUser(uid: String, userData: Dictionary<String, String>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
