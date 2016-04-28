//
//  CGFloat+LimitAndMap.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 28/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

extension CGFloat {
    
    func cut(from from: CGFloat, to: CGFloat) -> CGFloat {
        if self < from {
            return from
        }
        if self > to {
            return to
        }
        return self
    }
    
    func map(min min: CGFloat, max: CGFloat, from: CGFloat, to: CGFloat) -> CGFloat {
        return from + (to - from) * ((self - min) / (max - min))
    }
    
}
