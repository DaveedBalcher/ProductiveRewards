//
//  ProgressBarView.swift
//  ProductiveReward
//
//  Created by David Balcher on 1/17/16.
//  Copyright © 2016 Xpressive. All rights reserved.
//

import UIKit

protocol ProgressBarViewDelagate {

}
    
@IBDesignable class ProgressBarView: UIView {
    
    // Our custom view from the XIB file
    var view: UIView!
    
    var delegatePass: ProgressBarViewDelagate?
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var rewardTimeLabel: UILabel!
    
    var dailyWork = 0 {
        didSet {
//            timeLabel.text = currentWork.time?.toTimeString()
        }
    }
    
    var dailyReward = 0 {
        didSet {
            delay(1.0) { _ in
                self.rewardTimeLabel.text = self.dailyReward.toTimeString()
                animateText(self.rewardTimeLabel, numOfBlinks: 2)
            }
        }
    }
    
    func updateDailyProgress(dailyProgress: Progress) {
        dailyWork = dailyProgress.work
        dailyReward = dailyProgress.reward
    }
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "ProgressBarView", bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    
    // If you add custom drawing, it'll be behind any view loaded from XIB
    
    
    }
    */
        
}