//
//  SecondViewController.swift
//  Showcase
//
//  Created by Matěj Jirásek on 18/04/16.
//  Copyright © 2016 Matěj Kašpar Jirásek. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {

    weak var delegate: StyleUpdateDelegate?

    private var style = Style() {
        didSet {
            delegate?.styleUpdated(style)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = tabBarController as? StyleUpdateDelegate
    }

    // MARK: - Interface actions

    @IBAction private func lineWidthChanged(_ sender: UISlider) {
        style.lineWidth = CGFloat(sender.value)
    }

    @IBAction private func lineCapChanged(_ sender: UISegmentedControl) {
        style.lineCap = sender.selectedSegmentIndex
    }

    @IBAction private func lineJoinChanged(_ sender: UISegmentedControl) {
        style.lineJoin = sender.selectedSegmentIndex
    }

    @IBAction private func animationDurationChanged(_ sender: UISlider) {
        style.animationDuration = Double(sender.value)
    }

    @IBAction private func colorModeChanged(_ sender: UISegmentedControl) {
        style.animationColorMode = sender.selectedSegmentIndex
    }

    @IBAction private func animationTimingFunctionChanged(_ sender: UISegmentedControl) {
        style.animationTimingFunction = sender.selectedSegmentIndex + 1
    }

    @IBAction private func animationRepeatChanged(_ sender: UISwitch) {
        style.animationRepeat = sender.isOn
    }
}
