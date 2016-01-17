//
//  Reward.swift
//  ProductiveReward
//
//  Created by David Balcher on 1/17/16.
//  Copyright © 2016 Xpressive. All rights reserved.
//

import UIKit

protocol RewardDelagate {
    func timeDidFinish()
}

class Reward {
    var time: Int = 0
    var delagatePass: RewardDelagate?
    
    private var timer = NSTimer()
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(60, target:self, selector: Selector("decrementRewardTime"), userInfo: nil, repeats: true)
    }
    
    func pause() {
        timer.invalidate()
    }
    
    private func decrementRewardTime() {
        if time > 0 {
            time--
        } else {
            self.delagatePass?.timeDidFinish()
        }
    }
}
