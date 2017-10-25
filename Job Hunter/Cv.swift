//
//  Cv.swift
//  CV - Job Hunter
//
//  Created by Tim Mikelj on 29/07/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import SVProgressHUD

class Cv : ViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var outline1: UILabel!
    @IBOutlet weak var outline2: UILabel!
    @IBOutlet weak var outline3: UILabel!
    @IBOutlet weak var outline4: UILabel!
    @IBOutlet weak var outline5: UILabel!
    @IBOutlet weak var outline6: UILabel!
    @IBOutlet weak var outline7: UILabel!
    @IBOutlet weak var outline8: UILabel!
    @IBOutlet weak var smoutline1: UIImageView!
    @IBOutlet weak var smoutline2: UIImageView!
    @IBOutlet weak var smoutline3: UIImageView!
    @IBOutlet weak var smoutline4: UIImageView!
    
    var finalFullName = ""
    var finalEmailAddress = ""
    var finalMobileNumber = ""
    var finalHomeNumber = ""
    var finalHomeAddress = ""
    var finalPersonalTagline = ""
    
    var finalYourRole1 = ""
    var finalCompanyName1 = ""
    var finalWorkExperienceDateFrom1 = ""
    var finalWorkExperienceDateTo1 = ""
    var finalWorkExperienceTagline1 = ""
    var finalWorkExperienceAchievements1 = ""
    
    var finalYourRole2 = ""
    var finalCompanyName2 = ""
    var finalWorkExperienceDateFrom2 = ""
    var finalWorkExperienceDateTo2 = ""
    var finalWorkExperienceTagline2 = ""
    var finalWorkExperienceAchievements2 = ""
    
    var finalYourRole3 = ""
    var finalCompanyName3 = ""
    var finalWorkExperienceDateFrom3 = ""
    var finalWorkExperienceDateTo3 = ""
    var finalWorkExperienceTagline3 = ""
    var finalWorkExperienceAchievements3 = ""
    
    var finalYourRole4 = ""
    var finalCompanyName4 = ""
    var finalWorkExperienceDateFrom4 = ""
    var finalWorkExperienceDateTo4 = ""
    var finalWorkExperienceTagline4 = ""
    var finalWorkExperienceAchievements4 = ""
    
    var finalInstitutionName1 = ""
    var finalProgramName1 = ""
    var finalEducationDateFrom1 = ""
    var finalEducationDateTo1 = ""
    var finalEducationDetails1 = ""
    
    var finalInstitutionName2 = ""
    var finalProgramName2 = ""
    var finalEducationDateFrom2 = ""
    var finalEducationDateTo2 = ""
    var finalEducationDetails2 = ""
    
    var finalInstitutionName3 = ""
    var finalProgramName3 = ""
    var finalEducationDateFrom3 = ""
    var finalEducationDateTo3 = ""
    var finalEducationDetails3 = ""
    
    var finalFurtherExperienceTitle1 = ""
    var finalFurtherExperienceAchievements1 = ""
    
    var finalFurtherExperienceTitle2 = ""
    var finalFurtherExperienceAchievements2 = ""
    
    var finalFurtherExperienceTitle3 = ""
    var finalFurtherExperienceAchievements3 = ""
    
    
    var finalLinkedInLink = ""
    var finalTwitterLink = ""
    var finalInstagramLink = ""
    var finalFacebookLink = ""
    
    var finalReferences = ""

    let pdfData = NSMutableData()
    
func pdfFileName(aView: UIView, saveToDocumentsWithFileName fileName: String)   {
        UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil)
        UIGraphicsBeginPDFPage()
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return }
        
        aView.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        
        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let documentsFileName = documentDirectories + "/" + fileName
            print("documentsFileName")
            pdfData.write(toFile: documentsFileName, atomically: true)
            print("Resume saved success")
        }
    }

func configuredMailComposeViewController() -> MFMailComposeViewController {

            let mailCompose = MFMailComposeViewController()
            mailCompose.mailComposeDelegate = self
            mailCompose.setSubject(finalFullName + "'s Resume")
            mailCompose.setMessageBody("Please find my Resume attached", isHTML: false)
            print("Email ready")
            mailCompose.addAttachmentData(pdfData as Data, mimeType: "application/pdf", fileName: "Resume")
            print("Pdf added to Email")
            mailCompose.setMessageBody("CV created with Job Hunter, download on the App Store", isHTML: false)
    
            return mailCompose
    }
    
func showSendMailErrorAlert() {
        let alert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
   
func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        SVProgressHUD.show()
        SVProgressHUD.showSuccess(withStatus: "Email sent successfully!")
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveAsPdf(_ sender: Any) {
        
        pdfFileName(aView: cvView, saveToDocumentsWithFileName: "Resume")
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        SVProgressHUD.dismiss(withDelay: 1.5)
    }
    
    
    @IBAction func dismissCvView(_ sender: Any) {
        self.dismiss(animated: false)
    }
        
    @IBOutlet weak var cvView: UIView!
    
    //DETAILS SECTION
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var homeAddress: UITextView!
    @IBOutlet weak var personalTagline: UITextView!
    
    //WORK EXPERIENCE SECTION
    @IBOutlet weak var yourRole1: UITextField!
    @IBOutlet weak var companyName1: UITextField!
    @IBOutlet weak var workExperienceDateFrom1: UITextField!
    @IBOutlet weak var workExperienceDateTo1: UITextField!
    @IBOutlet weak var workExperienceTagline1: UITextView!
    @IBOutlet weak var workExperienceAchievements1: UITextView!
    
    @IBOutlet weak var yourRole2: UITextField!
    @IBOutlet weak var companyName2: UITextField!
    @IBOutlet weak var workExperienceDateFrom2: UITextField!
    @IBOutlet weak var workExperienceDateTo2: UITextField!
    @IBOutlet weak var workExperienceTagline2: UITextView!
    @IBOutlet weak var workExperienceAchievements2: UITextView!
    @IBOutlet weak var workExperience2View: UIView!
    
    @IBOutlet weak var yourRole3: UITextField!
    @IBOutlet weak var companyName3: UITextField!
    @IBOutlet weak var workExperienceDateFrom3: UITextField!
    @IBOutlet weak var workExperienceDateTo3: UITextField!
    @IBOutlet weak var workExperienceTagline3: UITextView!
    @IBOutlet weak var workExperienceAchievements3: UITextView!
    @IBOutlet weak var workExperience3View: UIView!
    

    
    //EDUCATION SECTION
    @IBOutlet weak var institutionName1: UITextField!
    @IBOutlet weak var programName1: UITextField!
    @IBOutlet weak var educationDateFrom1: UITextField!
    @IBOutlet weak var educationDateTo1: UITextField!
    @IBOutlet weak var educationDetails1: UITextView!
    
    @IBOutlet weak var institutionName2: UITextField!
    @IBOutlet weak var programName2: UITextField!
    @IBOutlet weak var educationDateFrom2: UITextField!
    @IBOutlet weak var educationDateTo2: UITextField!
    @IBOutlet weak var educationDetails2: UITextView!
    @IBOutlet weak var education2View: UIView!
    
    
    // FURTHER EXPERIENCE SECTION
    @IBOutlet weak var furtherExperienceTitle1: UITextField!
    @IBOutlet weak var furtherExperienceAchievements1: UITextView!
    
    @IBOutlet weak var furtherExperienceTitle2: UITextField!
    @IBOutlet weak var furtherExperienceAchievements2: UITextView!
    @IBOutlet weak var furtherExperience2View: UIView!
    
    
    //SOCIAL MEDIA SECTION
    @IBOutlet weak var linkedinLink: UITextField!
    @IBOutlet weak var twitterLink: UITextField!
    @IBOutlet weak var instagramLink: UITextField!
    @IBOutlet weak var facebookLink: UITextField!
    
    //REFERENCES
    @IBOutlet weak var referencesLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SVProgressHUD.setMinimumDismissTimeInterval(0.5)
        SVProgressHUD.showSuccess(withStatus: "CV Created successfully!")
        
        fullName.text = finalFullName
        emailAddress.text = finalEmailAddress
        mobileNumber.text = finalMobileNumber
        homeAddress.text = finalHomeAddress
        personalTagline.text = finalPersonalTagline
        
        yourRole1.text = finalYourRole1
        companyName1.text = finalCompanyName1
        workExperienceDateFrom1.text = finalWorkExperienceDateFrom1 + " -"
        workExperienceDateTo1.text = finalWorkExperienceDateTo1
        workExperienceTagline1.text = finalWorkExperienceTagline1
        workExperienceAchievements1.text = finalWorkExperienceAchievements1
        
        yourRole2.text = finalYourRole2
        companyName2.text = finalCompanyName2
        workExperienceDateFrom2.text = finalWorkExperienceDateFrom2 + " -"
        workExperienceDateTo2.text = finalWorkExperienceDateTo2
        workExperienceTagline2.text = finalWorkExperienceTagline2
        workExperienceAchievements2.text = finalWorkExperienceAchievements2
        
        yourRole3.text = finalYourRole3
        companyName3.text = finalCompanyName3
        workExperienceDateFrom3.text = finalWorkExperienceDateFrom3 + " -"
        workExperienceDateTo3.text = finalWorkExperienceDateTo3
        workExperienceTagline3.text = finalWorkExperienceTagline3
        workExperienceAchievements3.text = finalWorkExperienceAchievements3
        
        
        institutionName1.text = finalInstitutionName1
        programName1.text = finalProgramName1
        educationDateFrom1.text = finalEducationDateFrom1 + " -"
        educationDateTo1.text = finalEducationDateTo1
        educationDetails1.text = finalEducationDetails1
        
        institutionName2.text = finalInstitutionName2
        programName2.text = finalProgramName2
        educationDateFrom2.text = finalEducationDateFrom2 + " -"
        educationDateTo2.text = finalEducationDateTo2
        educationDetails2.text = finalEducationDetails2
    
        furtherExperienceTitle1.text = finalFurtherExperienceTitle1
        furtherExperienceAchievements1.text = finalFurtherExperienceAchievements1
        
        furtherExperienceTitle2.text = finalFurtherExperienceTitle2
        furtherExperienceAchievements2.text = finalFurtherExperienceAchievements2

        
        linkedinLink.text = finalLinkedInLink
        twitterLink.text = finalTwitterLink
        instagramLink.text = finalInstagramLink
        facebookLink.text = finalFacebookLink
        
        referencesLabel.text = finalReferences
        
    }
    
    
    @IBAction func blackColor(_ sender: Any) {
        outline1.textColor = UIColor.black
        outline2.textColor = UIColor.black
        outline3.textColor = UIColor.black
        outline4.textColor = UIColor.black
        outline5.textColor = UIColor.black
        outline6.textColor = UIColor.black
        outline7.textColor = UIColor.black
        outline8.textColor = UIColor.black
        fullName.textColor = UIColor.black
        smoutline1.image = smoutline1.image!.withRenderingMode(.alwaysTemplate)
        smoutline1.tintColor = UIColor.black
        smoutline2.image = smoutline2.image!.withRenderingMode(.alwaysTemplate)
        smoutline2.tintColor = UIColor.black
        smoutline3.image = smoutline3.image!.withRenderingMode(.alwaysTemplate)
        smoutline3.tintColor = UIColor.black
        smoutline4.image = smoutline4.image!.withRenderingMode(.alwaysTemplate)
        smoutline4.tintColor = UIColor.black
    }
    
    @IBAction func redColor(_ sender: Any) {
        outline1.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        outline2.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        outline3.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        outline4.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        outline5.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        outline6.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        outline7.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        outline8.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        fullName.textColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        smoutline1.image = smoutline1.image!.withRenderingMode(.alwaysTemplate)
        smoutline1.tintColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        smoutline2.image = smoutline2.image!.withRenderingMode(.alwaysTemplate)
        smoutline2.tintColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        smoutline3.image = smoutline3.image!.withRenderingMode(.alwaysTemplate)
        smoutline3.tintColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
        smoutline4.image = smoutline4.image!.withRenderingMode(.alwaysTemplate)
        smoutline4.tintColor = UIColor(red: 127/255, green: 18/255, blue: 0/255, alpha: 1)
    }
    
    @IBAction func purpleColor(_ sender: Any) {
        outline1.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        outline2.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        outline3.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        outline4.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        outline5.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        outline6.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        outline7.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        outline8.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        fullName.textColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        smoutline1.image = smoutline1.image!.withRenderingMode(.alwaysTemplate)
        smoutline1.tintColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        smoutline2.image = smoutline2.image!.withRenderingMode(.alwaysTemplate)
        smoutline2.tintColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        smoutline3.image = smoutline3.image!.withRenderingMode(.alwaysTemplate)
        smoutline3.tintColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
        smoutline4.image = smoutline4.image!.withRenderingMode(.alwaysTemplate)
        smoutline4.tintColor = UIColor(red: 173/255, green: 34/255, blue: 94/255, alpha: 1)
    }
    
    @IBAction func blueColor(_ sender: Any) {
        outline1.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        outline2.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        outline3.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        outline4.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        outline5.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        outline6.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        outline7.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        outline8.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        fullName.textColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        smoutline1.image = smoutline1.image!.withRenderingMode(.alwaysTemplate)
        smoutline1.tintColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        smoutline2.image = smoutline2.image!.withRenderingMode(.alwaysTemplate)
        smoutline2.tintColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        smoutline3.image = smoutline3.image!.withRenderingMode(.alwaysTemplate)
        smoutline3.tintColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
        smoutline4.image = smoutline4.image!.withRenderingMode(.alwaysTemplate)
        smoutline4.tintColor = UIColor(red: 0/255, green: 95/255, blue: 148/255, alpha: 1)
    }
    
    @IBAction func mintColor(_ sender: Any) {
        outline1.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        outline2.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        outline3.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        outline4.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        outline5.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        outline6.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        outline7.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        outline8.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        fullName.textColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        smoutline1.image = smoutline1.image!.withRenderingMode(.alwaysTemplate)
        smoutline1.tintColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        smoutline2.image = smoutline2.image!.withRenderingMode(.alwaysTemplate)
        smoutline2.tintColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        smoutline3.image = smoutline3.image!.withRenderingMode(.alwaysTemplate)
        smoutline3.tintColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
        smoutline4.image = smoutline4.image!.withRenderingMode(.alwaysTemplate)
        smoutline4.tintColor = UIColor(red: 0/255, green: 146/255, blue: 129/255, alpha: 1)
    }
    
    @IBAction func takeMeHomeButton(_ sender: Any) {
        self.present(alertController, animated: true, completion: nil)
        
        let okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
            self.switchViewControllers()
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
            
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

    }
    
    func switchViewControllers() {
        
        // switch root view controllers
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nav = storyboard.instantiateViewController(withIdentifier: "TbViewController")
        self.view.window?.rootViewController = nav
        
    }
    
    let alertController = UIAlertController(title: "For your own sanity", message: "Make sure you send your CV before returning to the home screen. Would you like to proceed?", preferredStyle: .alert)

}
