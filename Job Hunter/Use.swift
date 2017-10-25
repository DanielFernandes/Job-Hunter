//
//  Use.swift
//  Job Hunter
//
//  Created by Tim Mikelj on 12/10/2017.
//  Copyright © 2017 Tim Mikelj. All rights reserved.
//

import UIKit

class use: ViewController {
    
    @IBAction func dismissNr1(_ sender: Any) {
        self.dismiss(animated: false)
    }
    @IBAction func complete(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
