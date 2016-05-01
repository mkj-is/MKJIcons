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

    public func appearanceLineWidth() -> CGFloat {
        return lineWidth
    }

    public func setAppearanceLineWidth(property: CGFloat) {
        lineWidth = property
    }


    public func appearanceFillAlpha() -> CGFloat {
        return fillAlpha
    }

    public func setAppearanceFillAlpha(property: CGFloat) {
        fillAlpha = property
    }


    public func appearanceLineCapStyle() -> Int {
        return lineCapStyle
    }

    public func setAppearanceLineCapStyle(property: Int) {
        lineCapStyle = property
    }


    public func appearanceLineJoinStyle() -> Int {
        return lineJoinStyle
    }

    public func setAppearanceLineJoinStyle(property: Int) {
        lineJoinStyle = property
    }


    public func appearanceAnimationDuration() -> CGFloat {
        return CGFloat(animationDuration)
    }

    public func setAppearanceAnimationDuration(property: CGFloat) {
        animationDuration = Double(property)
    }


    public func appearanceAnimationTimingFunction() -> Int {
        return animationTimingFunction
    }

    public func setAppearanceAnimationTimingFunction(property: Int) {
        animationTimingFunction = property
    }


    public func appearanceAnimationColorMode() -> Int {
        return animationColorMode
    }

    public func setAppearanceAnimationColorMode(property: Int) {
        animationColorMode = property
    }



}
