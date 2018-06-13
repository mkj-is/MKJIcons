//
//  FirstViewController.swift
//  Showcase
//
//  Created by Matěj Jirásek on 18/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit
import MKJIcons

final class ShowcaseViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(styleChanged), name: .styleChange, object: nil)
    }

    @objc private func styleChanged(notification: NSNotification?) {
        if let userInfo = notification?.userInfo, let style = userInfo["style"] as? Style, let subviews = view.subviews.first?.subviews {
            for subview in subviews {
                if let icon = subview as? AnimatedIcon {
                    icon.applyStyle(style: style)
                }
            }
        }
    }
}
