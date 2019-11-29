//
//  TabBarController.swift
//  Showcase
//
//  Created by Matěj Kašpar Jirásek on 29/11/2019.
//  Copyright © 2019 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController, StyleUpdateDelegate {
    func styleUpdated(_ style: Style) {
        viewControllers?
            .compactMap { $0 as? StyleUpdateDelegate }
            .forEach { $0?.styleUpdated(style) }
        (tabBar as? StyleUpdateDelegate)?.styleUpdated(style)
    }
}
