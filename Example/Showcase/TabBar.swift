//
//  TabBar.swift
//  Showcase
//
//  Created by Matěj Jirásek on 19/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit
import MKJIcons

final class TabBar: UITabBar, StyleUpdateDelegate {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tintColor = .iconOrangeColor
        styleUpdated()
    }

    func styleUpdated(_ style: Style = Style()) {
        let iconFrame = CGRect(x: 0, y: 0, width: 60, height: 60)

        let starIcon = StarIcon(frame: iconFrame)
        let settingsIcon = SettingsIcon(frame: iconFrame)

        starIcon.applyStyle(style: style)
        settingsIcon.applyStyle(style: style)

        if let items = self.items {
            let starImage = starIcon.image(at: 1)
            let settingsImage = settingsIcon.image()

            items[0].image = starImage
            items[1].image = settingsImage

            items[0].selectedImage = starImage
            items[1].selectedImage = settingsImage
        }
    }
}
