//
//  UIBezierPath+IconInit.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 27/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

extension UIBezierPath {
    convenience init(style: AnimatedIcon) {
        self.init()
        lineWidth = style.scaledLineWidth
        lineCapStyle = style.lineCap
        lineJoinStyle = style.lineJoin
    }
}
