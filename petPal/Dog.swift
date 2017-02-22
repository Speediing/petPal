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
    
    var fed = 0
    var walked = 0
    var played = 0
    var health = 0.0
    var dogLevel = 1
    
    func getTimeDelta() -> Double{
        let currentDate = Date()
        let calendar = Calendar.current
        let midnightTime = DateComponents(year: (calendar.component(.year, from: currentDate) ), month: (calendar.component(.month, from: currentDate)), day: (calendar.component(.day, from: currentDate)) , hour: 0, second: 0)
        let midnightDate = calendar.date(from: midnightTime)!
        let date = currentDate.timeIntervalSince(midnightDate)
        let delta = (1 - (date / 86400))
        return delta
    }
    
    
    
    func checkStates(){
       let statesList = [fed, walked, played]
        var c = -1
        for i in statesList{
            c+=1
            print("i",i)
            if i == 1{
             print("stepped in")
             self.health += 85.34
            }
        }
        if self.fed == 1, self.walked == 1, self.played == 1{
        self.dogLevel += 1
        self.fed = 0
        self.played = 0
        self.walked = 0
        }
        if self.health > 256 {
        self.health = 256
        }
        

        
        
    }
   
    
    
}
