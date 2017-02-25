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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    
    
    

}


















