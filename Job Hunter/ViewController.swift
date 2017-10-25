//
//  ViewController.swift
//  CV - Job Hunter
//
//  Created by Tim Mikelj on 29/07/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func createANewCv(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let tutorialVC = storyboard.instantiateViewController(withIdentifier: "newCvTutorial") as! cvTutorial
        self.present(tutorialVC, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

