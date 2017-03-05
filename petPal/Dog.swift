//
//  DogHealth.swift
//  petPal
//
//  Created by Jason Wiker on 2017-02-21.
//  Copyright © 2017 jason. All rights reserved.
//

import Foundation

class Dog{
    var oftenToFeed = 1
    
    var frequency: Double = 1.0
    var health = 0.0
    var dogLevel = 1
    var didLevel = false
    static var name = ""
    var fed = false{
        didSet{
            print("k", self.health)
            self.health -= 85.34
            print("l", self.health)
        }
    }
    var walked = false{
            didSet{
            self.health -= 85.34
        }
    }
    
    var played = false{
        didSet{
            self.health -= 85.34
        }
    }

    
    func getTimeDelta(frequency: Double, currentTime: Int) -> Double{
        let timeAllowed = frequency * 60
        let delta = Double(currentTime)/timeAllowed
        return delta
    }
    
    
    
    func checkStates() {
        print("current health", self.health)
//        if dog.health == 256{
//        self.dogLevel = 0
        if self.health >= 256 {
            self.health = 0
            self.dogLevel = 1
            self.didLevel = false
            self.fed = false
            self.walked = false
            self.played = false
            
        }
        if self.fed == true, self.walked == true, self.played == true, self.didLevel == false{
        self.dogLevel += 1
        self.fed = false
        self.played = false
        self.walked = false
        self.didLevel = true
        }

        if self.health < 0{
        self.health = 0
            
        }
        
        
        
    }
   
    
    
}
