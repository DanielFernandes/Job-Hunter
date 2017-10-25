//
//  HomeView.swift
//  Job Hunter
//
//  Created by Tim Mikelj on 03/10/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit

class homeView: ViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
/*
    let quotes: NSArray = ["line1\nline2\nline3", ""]
    let range: UInt32 = UInt32(quotes.count)
    
    let randomNumber = Int(arc4random_uniform(range))
    let QuoteString = quotes.object(at: randomNumber)
    
    self.quoteLabel.text = QuoteString as? String
      */  
    }
    
    @IBAction func CreateNewCv(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PopUps", bundle: nil)
        let tutorialVC = storyboard.instantiateViewController(withIdentifier: "newCvTutorial") as! cvTutorial
        self.present(tutorialVC, animated: false, completion: nil)
    }
   
    @IBOutlet weak var quoteLabel: UILabel!
    
}
