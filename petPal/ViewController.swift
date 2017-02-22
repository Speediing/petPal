//
//  ViewController.swift
//  petPal
//
//  Created by Jason Wiker on 2017-02-21.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit
let dog = Dog()
class ViewController: UIViewController {
    
    @IBOutlet weak var cloud2: UIImageView!
    
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud1: UIImageView!
    
    @IBOutlet weak var secondaryBar: UIImageView!
    @IBOutlet weak var fedImage: UIImageView!
    @IBOutlet weak var playedImage: UIImageView!
    @IBOutlet weak var walkedImage: UIImageView!
    @IBAction func Feed(_ sender: UIButton) {
        dog.fed = 1
        setHealth()
        fedImage.image = UIImage(named:"check")!
    }
    struct defaultsKeys {
        static let keyOne = "firstStringKey"
        static let keyTwo = "secondStringKey"
    }
    @IBOutlet weak var dogHead: UIImageView!
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
        self.title = title
        let timer = Timer.scheduledTimer(
            timeInterval: 1.0, target: self, selector: #selector(setHealth),
            userInfo: nil, repeats: true)
        setHealth()
        let timer2 = Timer.scheduledTimer(
            timeInterval: 2.0, target: self, selector: #selector(animatePlease),
            userInfo: nil, repeats: true)
        
        
        //let defaults = UserDefaults.standard
        //if let stringOne = defaults.string(forKey: defaultsKeys.keyOne) {
        //  dog.dogLevel = Int(stringOne)!
        //}
    }
    func animatePlease(){
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut, animations: {
            self.dogHead.frame.origin.y -= 10
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseInOut, animations: {
            self.dogHead.frame.origin.y += 10
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseInOut, animations: {
            self.cloud1.frame.origin.x += 10
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseInOut, animations: {
            self.cloud1.frame.origin.x -= 10
        }, completion: nil)
        
    }
    func resetFlags(){
        playedImage.image = UIImage(named:"redx")!
        walkedImage.image = UIImage(named:"redx")!
        fedImage.image = UIImage(named:"redx")!

    }
    var didGetDelta = false
    var count = 0
    func setHealth(){
        count += 1
        if count == Int(dog.frequency * 60) ,  dog.didLevel == false{
        dog.dogLevel = 1
        self.count = 0
        resetFlags()
        }
        if count == Int(dog.frequency * 60){
        count = 0
        dog.didLevel = false
        resetFlags()
        }
        print("count", count)
        print("set health")
        print(dog.frequency * 60)
        if !didGetDelta, dog.didLevel == false{
            dog.health = dog.getTimeDelta(frequency: Double(dog.frequency), currentTime: count) * 256
            print(dog.health)
            
        }
        dog.checkStates()
        
        let title = (Dog.name + " - Level:" + String(dog.dogLevel))
        self.title = title
        let d = CGFloat(round(dog.health))
        print("d",d)
        let x = healthBar.frame.origin
        self.secondaryBar.frame = CGRect(x: x.x, y: x.y , width: CGFloat(46), height: d)
        let defaults = UserDefaults.standard
        
        defaults.setValue((String(dog.dogLevel)), forKey: defaultsKeys.keyOne)
        defaults.synchronize()
    }
    
    
    }

