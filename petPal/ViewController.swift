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
        
        let bar = healthBar.image
        let oldFrame = healthBar.frame
        
    }
    


}

