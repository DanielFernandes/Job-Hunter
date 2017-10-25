//
//  CvTutorialTransition.swift
//  Job Hunter
//
//  Created by Tim Mikelj on 27/09/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit

class cvTutorialTransition : ViewController {
    
    @IBAction func CreateNewCV(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tutorialVC = storyboard.instantiateViewController(withIdentifier: "CvDetails") as! CvDetails
        self.present(tutorialVC, animated: true, completion: nil)
    }
    
}
