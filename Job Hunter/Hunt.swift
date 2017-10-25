//
//  Hunt.swift
//  Job Hunter
//
//  Created by Tim Mikelj on 12/10/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit
import MessageUI

class hunt: ViewController, MFMailComposeViewControllerDelegate {
    
    @IBAction func dismissNr1(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func complete(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func jobHunterMobileEmail(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        mailCompose.setToRecipients(["jobhuntermobile@gmail.com"])
        mailCompose.setSubject("")
        mailCompose.setMessageBody("", isHTML: false)
        print("Email ready")
        
        return mailCompose
    }
    
    func showSendMailErrorAlert() {
        let alert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func confirmationAlert() {
        let confirmation = UIAlertController(title: "Congratulations!", message: "Your email has been sent.", preferredStyle: UIAlertControllerStyle.alert)
        confirmation.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(confirmation, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
}
