//
//  loginView.swift
//  Job Hunter
//
//  Created by Tim Mikelj on 05/10/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class loginView: ViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var nameErrorLabel: UILabel!

    
    @IBAction func loginPressed(_ sender: Any) {
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.show()
        FIRAuth.auth()?.signIn(withEmail: loginEmail.text!, password: loginPassword.text!, completion: { (user, error) in
            if error != nil {
                print(error!)
                SVProgressHUD.dismiss()
                self.errorLabel.text = "Email or Password are incorrect, please try again."
            }
            else {
                print("Login Successful")
                SVProgressHUD.dismiss()
                SVProgressHUD.setMinimumDismissTimeInterval(0.5)
                SVProgressHUD.showSuccess(withStatus: "Login successful!")
                if self.loginName.text != ""
                {
                    self.performSegue(withIdentifier: "loginToJobHunter", sender: sender)
                } else {
                    self.nameErrorLabel.text = "Please type your Name here"
                }

            }
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToJobHunter" {
            
            let jobHunterWelcome = segue.destination as! welcomeViewController
            jobHunterWelcome.finalWelcomeName = loginName.text!+"!"
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginPassword.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textField code
        
        textField.resignFirstResponder()  //if desired
        performAction()
        return true
    }
    
    func performAction() {
        loginPressed((Any).self)
        //action events
    }

    
}
