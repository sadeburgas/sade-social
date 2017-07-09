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
    
    //DB References
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    //Storage references
    private var _REF_POST_IMAGES = STORAGE_BASE.child("post-pics")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS:DatabaseReference {
        return _REF_USERS
    }
    
    var REF_POST_IMAGES:StorageReference {
        return _REF_POST_IMAGES
    }
    
    func createFirebasseDBUser(uid: String, userData: Dictionary<String, String>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
