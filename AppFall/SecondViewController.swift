//
//  SecondViewController.swift
//  AppFall
//
//  Created by Adrian Baumgart on 10.11.18.
//  Copyright © 2018 Adrian Baumgart. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {

    @IBAction func LoginBtn(_ sender: Any)
    {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        if Auth.auth().currentUser != nil {
            // User is signed in.
            // ...
        } else {
            // No user is signed in.
            self.performSegue(withIdentifier: "logoutsegue", sender: nil)
            // ...
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

