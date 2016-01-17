//
//  Utility.swift
//  ProductiveReward
//
//  Created by David Balcher on 1/17/16.
//  Copyright © 2016 Xpressive. All rights reserved.
//

import Foundation


// Utility Functions
func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}



// Extensions
extension Int {
    func toTimeString() -> String {
        let hours = String(format: "%02d", self/3600)
        //            let minutes = String(format: "%02d", (self/60) % 60)
        let seconds = String(format: "%02d", self % 60)
        return hours + ":" + seconds
    }
}