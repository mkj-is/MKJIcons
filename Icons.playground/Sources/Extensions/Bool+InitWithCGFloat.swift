//
//  Bool+ToCGFloat.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 26/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

extension Bool {
    
    init(float: CGFloat) {
        self = !float.isZero
    }
    
}
