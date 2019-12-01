//
//  FirstViewController.swift
//  Showcase
//
//  Created by Matěj Jirásek on 18/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit
import MKJIcons

final class ShowcaseViewController: UIViewController, StyleUpdateDelegate {
    func styleUpdated(_ style: Style) {
        for subview in view.subviews {
            if let icon = subview as? AnimatedIcon {
                icon.applyStyle(style: style)
            }
        }
    }
}
