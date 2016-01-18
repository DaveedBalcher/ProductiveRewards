//
//  StopWatch.swift
//  ProductiveReward
//
//  Created by David Balcher on 1/16/16.
//  Copyright © 2016 Xpressive. All rights reserved.
//

import Foundation

class Work {
    
    let startTime = NSDate()
    var stopTime: NSDate? = nil
    var time: Int? = nil
    
    func setStopTime() {
        stopTime = NSDate()
        time = Int(stopTime!.timeIntervalSinceDate(startTime) as Double)
    }
    
 }
