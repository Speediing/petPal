//
//  ViewController.swift
//  petPal
//
//  Created by Jason Wiker on 2017-02-21.
//  Copyright © 2017 jason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = Date()
        let calendar = Calendar.current
        let midnightTime = DateComponents(year: (calendar.component(.year, from: currentDate) ), month: (calendar.component(.month, from: currentDate)), day: (calendar.component(.day, from: currentDate)) , hour: 0, second: 0)
        let midnightDate = calendar.date(from: midnightTime)!
        var date = currentDate.timeIntervalSince(midnightDate)
        date = 1 - (date / 86400)
        print(date)
        
        
        
    }

    


}

