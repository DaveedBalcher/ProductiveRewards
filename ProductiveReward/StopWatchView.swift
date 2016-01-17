//
//  StopWatchView.swift
//  ProductiveReward
//
//  Created by David Balcher on 1/16/16.
//  Copyright © 2016 Xpressive. All rights reserved.
//

import UIKit

protocol StopWatchViewDelagate {
    func didRecieveWorkTime(times: [Work])
}

@IBDesignable class StopWatchView: UIView {
    
    // Our custom view from the XIB file
    var view: UIView!
    
    var delegatePass: StopWatchViewDelagate?
    
    @IBOutlet weak var swButton: UIButton!
    
    var workTimes: [Work] = [Work()]
//    var workTimeStrings: [String] = [""]
    
    @IBAction func startStop(sender: UIButton) {
        if let command = sender.titleLabel?.text {
            switch command {
            case "Start Work":
                workTimes.insert(Work(), atIndex: 0)
                swButton.setTitle("Stop Work", forState: UIControlState.Normal)
            case "Stop Work":
                workTimes[0].setStopTime()
//                workTimeStrings.insert(workTimes[0].timeString!, atIndex: 0)
//                print(workTimes[0].timeString!)
                swButton.setTitle("Start Work", forState: UIControlState.Normal)
                self.delegatePass?.didRecieveWorkTime(workTimes)
            default:
                print("error in StopWatchView")
            }
        }
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
        let nib = UINib(nibName: "StopWatchView", bundle: bundle)
        
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