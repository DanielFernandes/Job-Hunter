//
//  RegisterView.swift
//  Job Hunter
//
//  Created by Tim Mikelj on 05/10/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class registerView: ViewController, UITextFieldDelegate {
    
    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var registerPassword: UITextField!
    @IBOutlet weak var registrationName: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func registerPressed(_ sender: Any) {
       
        SVProgressHUD.show()
        //set up Firebase Database
        FIRAuth.auth()?.createUser(withEmail: registerEmail.text!, password: registerPassword.text!, completion: { (user, error) in
            if error != nil {
                print(error!)
                SVProgressHUD.dismiss()
                self.errorLabel.text = "Email or Password are not valid, please try again."
            }
                
            else {
                print("Registration successful")
                SVProgressHUD.dismiss()
                SVProgressHUD.setMinimumDismissTimeInterval(0.5)
                SVProgressHUD.showSuccess(withStatus: "Registration successful!")
                self.performSegue(withIdentifier: "beginJobHunter", sender: self)
            }
        })
    }
    
    @IBAction func backToLoginButton(_ sender: Any) {
        self.dismiss(animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "beginJobHunter" {
        
        let jobHunterWelcome = segue.destination as! welcomeViewController
            jobHunterWelcome.finalWelcomeName = registrationName.text!+"!"
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerPassword.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //textField code
        
        textField.resignFirstResponder()  //if desired
        performAction()
        return true
    }
    
    func performAction() {
        registerPressed((Any).self)
        //action events
    }
    
}
