//
//  CGFloat+LimitAndMap.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 28/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

extension CGFloat {

    func constrain(low: CGFloat, high: CGFloat) -> CGFloat {
        if self < low {
            return low
        }
        if self > high {
            return high
        }
        return self
    }

    func map(min: CGFloat, max: CGFloat, from: CGFloat, to: CGFloat) -> CGFloat {
        return from + (to - from) * ((self - min) / (max - min))
    }
}
