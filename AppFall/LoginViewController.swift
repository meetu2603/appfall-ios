//
//  LoginViewController.swift
//  AppFall
//
//  Created by Adrian Baumgart on 10.11.18.
//  Copyright © 2018 Adrian Baumgart. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var LoginErrorOutput: UILabel!
    @IBOutlet weak var EmailadressTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBAction func LoginBtn(_ sender: Any)
    {
        if EmailadressTF.text != "" && PasswordTF.text != "" {
            Auth.auth().signIn(withEmail: EmailadressTF.text!, password: PasswordTF.text!) { (user, fireerror) in
                if (fireerror != nil) {
                    self.LoginErrorOutput.text = fireerror?.localizedDescription
                }
                else {
                    self.LoginErrorOutput.text = "success"
                    self.performSegue(withIdentifier: "loggedinsegue", sender: nil)
                }
            }
    }
        else {
            LoginErrorOutput.text = "Bitte fülle alle Felder aus"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "loggedinsegue", sender: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
