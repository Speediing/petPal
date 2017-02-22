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
        //let defaults = UserDefaults.standard
        //if let stringOne = defaults.string(forKey: defaultsKeys.keyOne) {
          //  dog.dogLevel = Int(stringOne)!
        //}
    }
    
    var didGetDelta = false
    var count = 0
    func setHealth(){
        count += 1
        if count == Int(dog.frequency * 84600) ,  dog.didLevel == false{
        dog.dogLevel = 1
        self.count = 0
        }
        if count == Int(dog.frequency * 84600){
        count = 0
        dog.didLevel = false
        }
        print("count", count)
        print("set health")
        print(dog.frequency * 86400)
        if !didGetDelta, dog.didLevel == false{
            dog.health = dog.getTimeDelta(frequency: Double(dog.frequency), currentTime: count) * 256
            print(dog.health)
            //didGetDelta = true
        }
        dog.checkStates()
        
        let title = (Dog.name + " || Level:" + String(dog.dogLevel))
        self.title = title
        let d = CGFloat(round(dog.health))
        print("d",d)
        let x = healthBar.frame.origin
        self.healthBar.frame = CGRect(x: x.x, y: x.y , width: CGFloat(46), height: d)
        let defaults = UserDefaults.standard
        
        defaults.setValue((String(dog.dogLevel)), forKey: defaultsKeys.keyOne)
        defaults.synchronize()
    }
    
    
    }

