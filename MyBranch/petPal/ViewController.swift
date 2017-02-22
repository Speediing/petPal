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
    @IBOutlet weak var dogHead: UIImageView!

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
        
    }
    var didGetDelta = false
    func setHealth(){
        
        print("set health")
        if !didGetDelta{
            dog.health = dog.getTimeDelta(frequency: Double(dog.frequency)) * 256
            print(dog.health)
            //didGetDelta = true
        }
        dog.checkStates()
        let title = (Dog.name + " || Level:" + String(dog.dogLevel))
        self.title = title
        let d = CGFloat(round(dog.health))
        let x = secondaryBar.frame.origin
        self.healthBar.frame = CGRect(x: x.x, y: x.y , width: CGFloat(46), height: d)
        let defaults = UserDefaults.standard
        defaults.setValue((String(dog.dogLevel)), forKey: defaultsKeys.keyOne)
        defaults.synchronize()
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        coder.encode(dog.dogLevel, forKey: "doglevel")
        super.encodeRestorableState(with: coder)
    }
    override func decodeRestorableState(with coder: NSCoder) {
        dog.dogLevel = coder.decodeInteger(forKey: "doglevel")
        super.decodeRestorableState(with: coder)
    }
    }
