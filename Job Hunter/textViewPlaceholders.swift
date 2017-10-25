//
//  textViewPlaceholders.swift
//  CV - Job Hunter
//
//  Created by Tim Mikelj on 18/09/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit

class textViewPlaceholders: CvDetails {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalTagline.text = "Tagline here"
        personalTagline.textColor = UIColor.lightGray

    }
    
    func textViewDidBeginEditingTagline(_ textView: UITextView) {
        if personalTagline.textColor == UIColor.lightGray {
            personalTagline.text = nil
            personalTagline.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditingTagline(_ textView: UITextView) {
        if personalTagline.text.isEmpty {
            personalTagline.text = "Tagline here"
            personalTagline.textColor = UIColor.lightGray
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
