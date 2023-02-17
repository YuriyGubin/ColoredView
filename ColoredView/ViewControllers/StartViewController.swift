//
//  StartViewController.swift
//  ColoredView
//
//  Created by Yuriy on 17.02.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewBackground(withColor color: UIColor)
}

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewColor = view.backgroundColor
        settingsVC.delegate = self
    }
}


// MARK: - SettingsViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setViewBackground(withColor color: UIColor) {
        view.backgroundColor = color
    }
}
