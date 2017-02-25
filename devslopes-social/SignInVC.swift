//
//  ViewController.swift
//  devslopes-social
//
//  Created by János Csizmadia on 2/23/17.
//  Copyright © 2017 János Csizmadia. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (
            result, error) in
            
            if error != nil {
                print("JANO: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                
                print("JANO: User cancelled Facebook authentication")
            } else {
                
                print("JANO: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            
            if error != nil {
                print("JANO: Unable to authenticate with Firebase - \(error)")
            } else{
                print("JANO: Successfully authenticated with Firebase")
            }
        })
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        // IF email password is 5 or less char long, the signin wont work
        if let email = emailField.text, let pwd = passwordField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                
                if error == nil {
                    //The user existed, and the pw entered is correct
                    print("JANO: Email user authenticated with firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        
                        if error != nil {
                            print("JANO: Unable to authenticate with firebase using email")
                        } else {
                            print("JANO: Successfully authenticated with Firebase using email")
                        }
                    })
                }
            })
        }
    }
    
    
    

}


















