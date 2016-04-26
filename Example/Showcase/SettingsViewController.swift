//
//  SecondViewController.swift
//  Showcase
//
//  Created by Matěj Jirásek on 18/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit
import MKJIcons

class SettingsViewController: ViewController {
    
    let style = Style()
    
    func update() {
        NSNotificationCenter.defaultCenter().postNotificationName("styleChanged", object: self, userInfo: ["style": style])
    }
    
    
    // MARK: - Interface actions
    
    @IBAction func lineWidthChanged(sender: UISlider) {
        style.lineWidth = CGFloat(sender.value)
        update()
    }
    
    @IBAction func lineCapChanged(sender: UISegmentedControl) {
        style.lineCap = sender.selectedSegmentIndex
        update()
    }
    
    @IBAction func lineJoinChanged(sender: UISegmentedControl) {
        style.lineJoin = sender.selectedSegmentIndex
        update()
    }
    
    @IBAction func animationDurationChanged(sender: UISlider) {
        style.animationDuration = Double(sender.value)
        update()
    }
    
    @IBAction func colorModeChanged(sender: UISegmentedControl) {
        style.animationColorMode = sender.selectedSegmentIndex
        update()
    }
    
    @IBAction func animationTimingFunctionChanged(sender: UISegmentedControl) {
        style.animationTimingFunction = sender.selectedSegmentIndex + 1
        update()
    }
    
    @IBAction func animationRepeatChanged(sender: UISwitch) {
        style.animationRepeat = sender.on
        update()
    }
    

}

