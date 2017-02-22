//
//  WizardViewController.swift
//  petPal
//
//  Created by Jason Wiker on 2017-02-22.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class introViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField.delegate = self

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        Dog.name = textField.text!
        performSegue(withIdentifier: "doggoName", sender: self)
        
        return true
    }
    

}
