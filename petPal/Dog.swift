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
    
    func getTimeDelta() -> Double{
        let currentDate = Date()
        let calendar = Calendar.current
        let midnightTime = DateComponents(year: (calendar.component(.year, from: currentDate) ), month: (calendar.component(.month, from: currentDate)), day: (calendar.component(.day, from: currentDate)) , hour: 0, second: 0)
        let midnightDate = calendar.date(from: midnightTime)!
        var date = currentDate.timeIntervalSince(midnightDate)
        let delta = 1 - (date / 86400)
        return delta
    }
    
    
    
    func checkStates(){
       let statesList = [fed, walked, played]
        for i in statesList{
            if i == 1{
             health += 33.3
            }
        }
        if health > 100 {
        health = 100
        }
        

        
        
    }
    func getExcersise(){
        
    }
    func getHappiness(){
        
    }
    
    
}
