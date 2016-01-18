//
//  ViewController.swift
//  ProductiveReward
//
//  Created by David Balcher on 1/16/16.
//  Copyright © 2016 Xpressive. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, StopWatchViewDelagate {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var swView: StopWatchView!
    @IBOutlet weak var progressBarView: ProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        swView.delegatePass = self
    }
    
    
    // Compontents Of Productive Work Day
    var currentWork = Work() {
        didSet {
            timeLabel.text = currentWork.time?.toTimeString()
            animateText(timeLabel, numOfBlinks: 2)
            delay(1.8) { _ in
                self.setDailyProgress()
            }
        }
    }
    
    var currentReward = Reward()
    
    var dailyProgress: Progress = Progress()
    var workRewardFactor = 0.2
    var workQuality = 0.5
    
    func setDailyProgress() {
        dailyProgress.work += currentWork.time!
        currentReward.time = Int(Double(currentWork.time!) * workRewardFactor * (workQuality * 2))
        dailyProgress.reward += currentReward.time
        
        // Set UI To Show Daily Progress
        timeLabel.text = dailyProgress.work.toTimeString()
        delay(0.1) { _ in
            animateText(self.timeLabel, numOfBlinks: 1)
        }
        progressBarView.updateDailyProgress(dailyProgress)
    }
    
    func didRecieveWorkTime(times: [Work]) {
        currentWork = times[0]
    }

}



