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
    
    var frequency: Float = 1.0
    var fed = 0
    var walked = 0
    var played = 0
    var health = 0.0
    var dogLevel = 1
    var didLevel = false
    static var name = ""
    
    func getTimeDelta(frequency: Double, currentTime: Int) -> Double{
        let timeAllowed = frequency * 60
        print("time allowed", timeAllowed)
        let delta = Double(currentTime)/timeAllowed
        
       
        
        
        print("delta", delta)
        return delta
    }
    
    
    
    func checkStates() {
       let statesList = [fed, walked, played]
        var c = -1
        for i in statesList{
            c+=1
            if i == 1{
             self.health -= 85.34
            }
        }
        if self.fed == 1, self.walked == 1, self.played == 1, self.didLevel == false{
        self.dogLevel += 1
        self.fed = 0
        self.played = 0
        self.walked = 0
        self.didLevel = true
        }
        if self.health > 256 {
        self.health = 256
        }
        if self.health < 0{
        self.health = 0
        }
        
        
        
    }
   
    
    
}
