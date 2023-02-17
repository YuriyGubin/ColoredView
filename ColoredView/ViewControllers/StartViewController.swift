//
//  StartViewController.swift
//  ColoredView
//
//  Created by Yuriy on 17.02.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewBackground(forColor color: UIColor)
}

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewColor = view.backgroundColor
        settingsVC
    }
}


// MARK: - SettingsViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setViewBackground(forColor color: UIColor) {
        view.backgroundColor = color
    }
}
