//
//  SignUpVC.swift
//  micoSAT app
//
//  Created by GaryS on 4/22/15.
//  Copyright (c) 2015 Khagay . Nagdimov. All rights reserved.
//

import UIKit
import Parse

class SignupVC: UIViewController {
    
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var txtEmail : UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func gotoLogin(sender : UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func signupTapped(sender : UIButton) {
        var uname:NSString = txtUsername.text as NSString
        var pswd:NSString = txtPassword.text as NSString
        var emailentered:NSString = txtEmail.text as NSString
        
        func userSignUp(){
            var user = PFUser();
            user.username = uname as String;
            user.password = pswd as String
            user.email = emailentered as String
        
        user.signUpInBackgroundWithBlock {
            (success, error) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
                self.messageLabel.text = "User Signed Up";
                self.txtUsername.text = ""
                self.txtEmail.text = ""
                self.txtPassword.text = ""
            } else {
                self.messageLabel.text = "Error Occured!"
            }
            }
        }
        
        if uname != "" && pswd != "" && emailentered != "" {
            userSignUp()
        }
        else {
            self.messageLabel.text = "All Fields Required"
            /*
            {
                NSLog("Sign Up SUCCESS");
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            */
        }
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}