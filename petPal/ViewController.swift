//
//  ViewController.swift
//  petPal
//
//  Created by Jason Wiker on 2017-02-21.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dog = Dog()
    
    @IBOutlet weak var secondaryBar: UIImageView!
    @IBAction func Feed(_ sender: UIButton) {
        dog.fed = 1
    }
    
    @IBAction func Walk(_ sender: UIButton) {
        dog.walked = 1
    }
    
    
    @IBAction func Play(_ sender: UIButton) {
        dog.played = 1
    }
    @IBOutlet weak var healthBar: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setHealth()
        
    }
    
    
    func setHealth(){
    dog.health = dog.getTimeDelta()
    dog.checkStates()
        let x = secondaryBar.frame.origin
        
        self.healthBar.frame = CGRect(x: x., y: 50, width: 50,height: 50 )
        
    }
    


}

