//
//  FeedVC.swift
//  sade-social
//
//  Created by sade on 6/7/17.
//  Copyright © 2017 sade. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   
    @IBAction func signInTapped(_ sender: Any) {
        let keyResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("DILYAN: ID removed for keychain true \(keyResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    


}
