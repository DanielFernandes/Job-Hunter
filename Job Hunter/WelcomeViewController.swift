//
//  WelcomeViewController.swift
//  Job Hunter
//
//  Created by Tim Mikelj on 04/10/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit

class welcomeViewController: ViewController {
    
    var finalWelcomeName = ""
    @IBOutlet weak var welcomeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        welcomeName.text = finalWelcomeName
        
    }

}
