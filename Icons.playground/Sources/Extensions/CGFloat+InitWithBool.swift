//
//  CGFloat+ToBool.swift
//  MKJIcons
//
//  Created by Matěj Jirásek on 26/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

extension CGFloat {

    init(bool: Bool) {
        self = (bool ? 1 : 0)
    }

}
