//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Heekyung kim on 3/15/19.
//  Copyright © 2019 Heekyung kim. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    let alertController = UIAlertController(title: "Title", message: "Your Username or Password field cannot be blank", preferredStyle: .alert)
    
    @IBOutlet weak var usernamefield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!

    @IBAction func tapSignUp(_ sender: Any) {
        registerUser()
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        loginUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        
        if (usernamefield.text?.isEmpty)! || (passwordfield.text?.isEmpty)! {
        present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
               self.alert()
            }
        } else {
            newUser.username = usernamefield.text
            newUser.password = passwordfield.text
        }
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print("User registration failed \(error.localizedDescription)")
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            }
        }
        
    }
    
    func loginUser() {
        
        let username = usernamefield.text ?? ""
        let password = passwordfield.text ?? ""
        
        
        if (usernamefield.text?.isEmpty)! || (passwordfield.text?.isEmpty)! {
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                self.alert()
            }
        }
        
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    func alert() {
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        self.alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.viewDidLoad()
        }
        // add the OK action to the alert controller
        self.alertController.addAction(OKAction)
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
}
