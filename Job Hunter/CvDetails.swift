//
//  CVDetails.swift
//  CV - Job Hunter
//
//  Created by Tim Mikelj on 29/07/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit

class CvDetails : ViewController {

    var References = ""
    
    @IBAction func personalTaglineInfoButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "personalTagline") as! popUpPersonalTagline
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func workExperienceTaglineButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WorkExperienceTaglineWhat") as! workExperienceTagline
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func workExperienceDescriptionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WorkExperienceWhat") as! workExperience
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func educationDescriptionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EducationWhat") as! educationPopUp
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func furtherExperienceButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FurtherExperienceWhat") as! furtherExperience
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func socialMediaWhatButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SocialMediaWhat") as! socialMediaWhat
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func dissmisButton(_ sender: Any) {
        switchViewControllers()
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func switchViewControllers() {
        
        // switch root view controllers
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nav = storyboard.instantiateViewController(withIdentifier: "TbViewController")
        self.view.window?.rootViewController = nav
        
    }
    
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

    @IBOutlet weak var yourRole3: UITextField!
    @IBOutlet weak var companyName3: UITextField!
    @IBOutlet weak var workExperienceDateFrom3: UITextField!
    @IBOutlet weak var workExperienceDateTo3: UITextField!
    @IBOutlet weak var workExperienceTagline3: UITextView!
    @IBOutlet weak var workExperienceAchievements3: UITextView!

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
    
//FURTHER EXPERIENCE SECTION
    @IBOutlet weak var furtherExperienceTitle1: UITextField!
    @IBOutlet weak var furtherExperienceAchievements1: UITextView!
    
    @IBOutlet weak var furtherExperienceTitle2: UITextField!
    @IBOutlet weak var furtherExperienceAchievements2: UITextView!
    
//SOCIAL MEDIA SECTION
    @IBOutlet weak var linkedinLink: UITextField!
    @IBOutlet weak var twitterLink: UITextField!
    @IBOutlet weak var instagramLink: UITextField!
    @IBOutlet weak var facebookLink: UITextField!
  
//REFERENCES
    
    @IBOutlet weak var referenceSegmentedControl: UISegmentedControl!
    @IBAction func referencesAvailiable(_ sender: Any) {
        switch referenceSegmentedControl.selectedSegmentIndex {
        case 0:
            print("no references availiable selected")
            References = ""
        
        case 1:
            print("references available on request")
            References = "References available upon request."
            
        default:
            References = ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func CvDetailsNext() {
        performSegue(withIdentifier: "sendCvDetails", sender: self)
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendCvDetails" {
            
            let finalCv = segue.destination as! Cv
            
            finalCv.finalFullName = fullName.text!
            finalCv.finalEmailAddress = emailAddress.text!
            finalCv.finalMobileNumber = mobileNumber.text!
            finalCv.finalHomeAddress = homeAddress.text!
            finalCv.finalPersonalTagline = personalTagline.text!
            
    //WORK EXPERIENCE SECTION
            finalCv.finalYourRole1 = yourRole1.text!
            finalCv.finalCompanyName1 = companyName1.text!
            finalCv.finalWorkExperienceDateFrom1 = workExperienceDateFrom1.text!
            finalCv.finalWorkExperienceDateTo1 = workExperienceDateTo1.text!
            finalCv.finalWorkExperienceTagline1 = workExperienceTagline1.text!
            finalCv.finalWorkExperienceAchievements1 = workExperienceAchievements1.text!
            
            finalCv.finalYourRole2 = yourRole2.text!
            finalCv.finalCompanyName2 = companyName2.text!
            finalCv.finalWorkExperienceDateFrom2 = workExperienceDateFrom2.text!
            finalCv.finalWorkExperienceDateTo2 = workExperienceDateTo2.text!
            finalCv.finalWorkExperienceTagline2 = workExperienceTagline2.text!
            finalCv.finalWorkExperienceAchievements2 = workExperienceAchievements2.text!
            
            finalCv.finalYourRole3 = yourRole3.text!
            finalCv.finalCompanyName3 = companyName3.text!
            finalCv.finalWorkExperienceDateFrom3 = workExperienceDateFrom3.text!
            finalCv.finalWorkExperienceDateTo3 = workExperienceDateTo3.text!
            finalCv.finalWorkExperienceTagline3 = workExperienceTagline3.text!
            finalCv.finalWorkExperienceAchievements3 = workExperienceAchievements3.text!
            
    //EDUCATION SECTION
            finalCv.finalInstitutionName1 = institutionName1.text!
            finalCv.finalProgramName1 = programName1.text!
            finalCv.finalEducationDateFrom1 = educationDateFrom1.text!
            finalCv.finalEducationDateTo1 = educationDateTo1.text!
            finalCv.finalEducationDetails1 = educationDetails1.text!
            
            finalCv.finalInstitutionName2 = institutionName2.text!
            finalCv.finalProgramName2 = programName2.text!
            finalCv.finalEducationDateFrom2 = educationDateFrom2.text!
            finalCv.finalEducationDateTo2 = educationDateTo2.text!
            finalCv.finalEducationDetails2 = educationDetails2.text!
            
    //FURTHER EXPERIENCE
            finalCv.finalFurtherExperienceTitle1 = furtherExperienceTitle1.text!
            finalCv.finalFurtherExperienceAchievements1 = furtherExperienceAchievements1.text!
            
            finalCv.finalFurtherExperienceTitle2 = furtherExperienceTitle2.text!
            finalCv.finalFurtherExperienceAchievements2 = furtherExperienceAchievements2.text!
            
    //SOCIAL MEDIA SECTION
            finalCv.finalLinkedInLink = linkedinLink.text!
            finalCv.finalTwitterLink = twitterLink.text!
            finalCv.finalInstagramLink = instagramLink.text!
            finalCv.finalFacebookLink = facebookLink.text!
            
    //REFERENCES
            finalCv.finalReferences = References
            
        }
    }
}
