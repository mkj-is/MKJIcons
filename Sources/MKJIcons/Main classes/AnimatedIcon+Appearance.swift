//
//  AnimatedIcon+Appearance.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 19/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

public extension AnimatedIcon {

    // MARK: - Appearance protocol support

    func appearanceLineWidth() -> CGFloat {
        return lineWidth
    }

    func setAppearanceLineWidth(property: CGFloat) {
        lineWidth = property
    }

    func appearanceFillAlpha() -> CGFloat {
        return fillAlpha
    }

    func setAppearanceFillAlpha(property: CGFloat) {
        fillAlpha = property
    }

    func appearanceLineCapStyle() -> Int {
        return lineCapStyle
    }

    func setAppearanceLineCapStyle(property: Int) {
        lineCapStyle = property
    }

    func appearanceLineJoinStyle() -> Int {
        return lineJoinStyle
    }

    func setAppearanceLineJoinStyle(property: Int) {
        lineJoinStyle = property
    }

    func appearanceAnimationDuration() -> CGFloat {
        return CGFloat(animationDuration)
    }

    func setAppearanceAnimationDuration(property: CGFloat) {
        animationDuration = Double(property)
    }

    func appearanceAnimationTimingFunction() -> Int {
        return animationTimingFunction
    }

    func setAppearanceAnimationTimingFunction(property: Int) {
        animationTimingFunction = property
    }

    func appearanceAnimationColorMode() -> Int {
        return animationColorMode
    }

    func setAppearanceAnimationColorMode(property: Int) {
        animationColorMode = property
    }
}
