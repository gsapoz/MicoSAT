//
//  LoginVC.swift
//  micoSAT app
//
//  Created by GaryS on 4/22/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit
import Parse
import Foundation

class LoginVC: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func signinTapped(sender : UIButton) {
     
        var email:NSString = txtUsername.text
        var userPassword:NSString = txtPassword.text
        
        if ( email.isEqualToString("") || userPassword.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        else{
        PFUser.logInWithUsernameInBackground(email as String, password:userPassword as String) { (user, error) -> Void in
            if user != nil{
            
                NSLog("Login SUCCESS");
                    
                    
                var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                prefs.setObject(email, forKey: "USERNAME")
                prefs.setInteger(1, forKey: "ISLOGGEDIN")
                prefs.synchronize()
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else if user == nil{
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = "User not found. Please Sign up..."
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
                self.txtPassword.text = ""
                }
            }
        }
        
    }
}
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
