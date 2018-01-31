//
//  SecondViewController.swift
//  Showcase
//
//  Created by Matěj Jirásek on 18/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

class SettingsViewController: ViewController {

    let style = Style()

    func update() {
        NotificationCenter.default.post(name: Notification.Name.StyleChange, object: self, userInfo: ["style": style])
    }

    // MARK: - Interface actions

    @IBAction func lineWidthChanged(_ sender: UISlider) {
        style.lineWidth = CGFloat(sender.value)
        update()
    }

    @IBAction func lineCapChanged(_ sender: UISegmentedControl) {
        style.lineCap = sender.selectedSegmentIndex
        update()
    }

    @IBAction func lineJoinChanged(_ sender: UISegmentedControl) {
        style.lineJoin = sender.selectedSegmentIndex
        update()
    }

    @IBAction func animationDurationChanged(_ sender: UISlider) {
        style.animationDuration = Double(sender.value)
        update()
    }

    @IBAction func colorModeChanged(_ sender: UISegmentedControl) {
        style.animationColorMode = sender.selectedSegmentIndex
        update()
    }

    @IBAction func animationTimingFunctionChanged(_ sender: UISegmentedControl) {
        style.animationTimingFunction = sender.selectedSegmentIndex + 1
        update()
    }

    @IBAction func animationRepeatChanged(_ sender: UISwitch) {
        style.animationRepeat = sender.isOn
        update()
    }

}
