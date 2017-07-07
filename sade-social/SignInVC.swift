//
//  SignInVC.swift
//  sade-social
//
//  Created by sade on 5/7/17.
//  Copyright © 2017 sade. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyField!
    
    @IBOutlet weak var pwdField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

   
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            print("DILYAN: ID found in keychain")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("DILYAN: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("DILYAN: User cancelled Facebook authentication")
            } else {
                print("DILYAN: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("DILYAN: Unable to authenticate with Firebase - \(error.debugDescription)")
            } else {
                print("DILYAN: Successfully authenticated with Firebase")
                if let user = user {
                    let userData = ["provider": credential.provider]
                   self.completeSignIn(id: user.uid, userData: userData)
                }

                }
        })
    }

    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("DILYAN: Email user authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: {(user, error) in
                        if error != nil {
                            print("DILYAN. Unable authenticate with Firebase using email")
                        } else {
                            print("DILYAN: Successfuly authenticated with Firebase")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                              self.completeSignIn(id: user.uid, userData: userData)
                            }
                           
                        }
                    
                    })
                }
            
            })
        }
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        
       DataService.ds.createFirebasseDBUser(uid: id, userData: userData)
        
       let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Dilyan: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

