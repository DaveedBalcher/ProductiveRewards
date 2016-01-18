//
//  Animations.swift
//  ProductiveReward
//
//  Created by David Balcher on 1/17/16.
//  Copyright © 2016 Xpressive. All rights reserved.
//

import UIKit

// Animations
private let defaultTextColor = UIColor.init(red: 174/256.0, green: 174/256.0, blue: 217/256.0, alpha: 1.0)

func animateText(label: UILabel, numOfBlinks: Int) {
    label.textColor = UIColor.redColor()
    UIView.animateWithDuration(0.8, delay: 0.3, usingSpringWithDamping: 3.0, initialSpringVelocity: 1.0, options: .Repeat, animations: { _ in
        UIView.setAnimationRepeatCount(Float(numOfBlinks))
        label.alpha = 0.0
        },
        completion: { _ in
            label.textColor = defaultTextColor
            label.alpha = 1.0
    })
}
