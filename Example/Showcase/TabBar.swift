//
//  TabBar.swift
//  Showcase
//
//  Created by Matěj Jirásek on 19/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit
import MKJIcons

class TabBar: UITabBar {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        tintColor = UIColor.iconOrangeColor
        
        let iconFrame = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        let starIcon = StarIcon(frame: iconFrame).image(1)
        let settingsIcon = SettingsIcon(frame: iconFrame).image()
        
        if let items = self.items {
            items[0].image = starIcon
            items[1].image = settingsIcon
        }
    }

}
