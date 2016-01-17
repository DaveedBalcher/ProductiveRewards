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
//    var timeString: String? = nil
    
    func setStopTime() {
        stopTime = NSDate()
        time = Int(stopTime!.timeIntervalSinceDate(startTime) as Double)
//        setWorkTimeString()
    }
    
//    private func setWorkTimeString() {
//        if let realTime = time {
//            let intTime = Int(realTime)
//            let hours = intTime / 3600
//            let minutes = (intTime ) % 60
//            
//            var hoursString: String
//            if hours < 10 {
//                hoursString = "0\(hours)"
//            } else {
//                hoursString = "\(hours)"
//            }
//            
//            var minutesString: String
//            if minutes < 10 {
//                minutesString = "0\(minutes)"
//            } else {
//                minutesString = "\(minutes)"
//            }
//            
//            timeString = hoursString + ":" + minutesString
//        }
//    }
}
