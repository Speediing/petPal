//
//  SettingsViewController.swift
//  petPal
//
//  Created by Jason Wiker on 2017-02-22.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var care: UISlider!
    @IBAction func careFrequency(_ sender: UISlider) {
        dog.frequency = care.value
        print(dog.frequency)
    }
    
    @IBOutlet weak var dogField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        care.isContinuous = false
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
