//
//  FirstViewController.swift
//  Showcase
//
//  Created by Matěj Jirásek on 18/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit
import MKJIcons

class ShowcaseViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(styleChanged(_:)), name: "styleChanged", object: nil)
        
    }
    
    func styleChanged(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            let style = userInfo["style"] as! Style
            
            if let subviews = view.subviews.first?.subviews {
                for subview in subviews {
                    if subview.isKindOfClass(AnimatedIcon) {
                        let icon = (subview as! AnimatedIcon)
                        
                        icon.lineWidth = style.lineWidth
                        icon.lineCapStyle = style.lineCap
                        icon.lineJoinStyle = style.lineJoin
                        icon.animationColorMode = style.animationColorMode
                        icon.animationTimingFunction = style.animationTimingFunction
                        icon.animationDuration = style.animationDuration
                    }
                }
            }
        }
    }

}

