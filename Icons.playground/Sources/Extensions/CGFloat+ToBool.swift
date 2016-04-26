//
//  CGFloat+ToBool.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 26/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

extension CGFloat {
    
    func toBool() -> Bool {
        return self == 0 ? false : true
    }
    
}
