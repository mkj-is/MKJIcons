//
//  SecondViewController.swift
//  Showcase
//
//  Created by Matěj Jirásek on 18/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

final class SettingsViewController: ViewController {

    private let style = Style()

    func update() {
        NotificationCenter.default.post(name: Notification.Name.StyleChange, object: self, userInfo: ["style": style])
    }

    // MARK: - Interface actions

    @IBAction private func lineWidthChanged(_ sender: UISlider) {
        style.lineWidth = CGFloat(sender.value)
        update()
    }

    @IBAction private func lineCapChanged(_ sender: UISegmentedControl) {
        style.lineCap = sender.selectedSegmentIndex
        update()
    }

    @IBAction private func lineJoinChanged(_ sender: UISegmentedControl) {
        style.lineJoin = sender.selectedSegmentIndex
        update()
    }

    @IBAction private func animationDurationChanged(_ sender: UISlider) {
        style.animationDuration = Double(sender.value)
        update()
    }

    @IBAction private func colorModeChanged(_ sender: UISegmentedControl) {
        style.animationColorMode = sender.selectedSegmentIndex
        update()
    }

    @IBAction private func animationTimingFunctionChanged(_ sender: UISegmentedControl) {
        style.animationTimingFunction = sender.selectedSegmentIndex + 1
        update()
    }

    @IBAction private func animationRepeatChanged(_ sender: UISwitch) {
        style.animationRepeat = sender.isOn
        update()
    }
}
