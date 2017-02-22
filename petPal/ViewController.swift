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
    @IBOutlet weak var fedImage: UIImageView!
    @IBOutlet weak var playedImage: UIImageView!
    @IBOutlet weak var walkedImage: UIImageView!
    @IBAction func Feed(_ sender: UIButton) {
        dog.fed = 1
        setHealth()
        fedImage.image = UIImage(named:"check")!
    }
    
    @IBAction func Walk(_ sender: UIButton) {
        dog.walked = 1
        setHealth()
        walkedImage.image = UIImage(named:"check")!
    }
    
    
    @IBAction func Play(_ sender: UIButton) {
        dog.played = 1
        setHealth()
        playedImage.image = UIImage(named:"check")!
    }
    @IBOutlet weak var healthBar: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let title = ("doggo ||" + String(dog.dogLevel))
        self.title = title
        let timer = Timer.scheduledTimer(
            timeInterval: 1.0, target: self, selector: #selector(setHealth),
            userInfo: nil, repeats: true)
        setHealth()
        
    }
    
    var didGetDelta = false
    func setHealth(){
        
        if !didGetDelta{
            dog.health = dog.getTimeDelta() * 256
            print(dog.health)
            didGetDelta = true
        }
        dog.checkStates()
        let title = ("doggo || Level:" + String(dog.dogLevel))
        self.title = title
        let d = CGFloat(round(dog.health))
        print(d)
        let x = secondaryBar.frame.origin
        self.healthBar.frame = CGRect(x: x.x, y: x.y , width: CGFloat(46), height: d)
        
    }
    
    
    
}

