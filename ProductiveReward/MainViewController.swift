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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        swView.delegatePass = self
    }
    
    
    // Compontents Of Productive Work Day
    var currentWork = Work() {
        didSet {
            timeLabel.text = currentWork.time?.toTimeString()
            animateText(timeLabel, numOfBlinks: 3)
            delay(2.4) { _ in
                self.setDailyProgress()
            }
        }
    }
    
    var currentReward = Reward()
    
    struct Progress { var work: Int = 0, reward: Int = 0 }
    
    var dailyProgress: Progress = Progress() {
        didSet {
            timeLabel.text = dailyProgress.work.toTimeString()
            animateText(timeLabel, numOfBlinks: 1)
        }
    }
    
    func setDailyProgress() {
        dailyProgress.work += currentWork.time!
    }
    
    func didRecieveWorkTime(times: [Work]) {
        currentWork = times[0]
    }

    
    // Animations
    private let defaultTextColor = UIColor.init(red: 174/256.0, green: 174/256.0, blue: 217/256.0, alpha: 1.0)
    
    func animateText(label: UILabel, numOfBlinks: Int) {
        label.textColor = UIColor.redColor()
        UIView.animateWithDuration(0.8, delay: 0.3, usingSpringWithDamping: 3.0, initialSpringVelocity: 1.0, options: .Repeat, animations: { _ in
            UIView.setAnimationRepeatCount(Float(numOfBlinks + 1))
            label.alpha = 0.0
            },
            completion: { _ in
                label.textColor = self.defaultTextColor
                label.alpha = 1.0
        })
    }
    
}



