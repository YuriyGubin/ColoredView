//
//  StartViewController.swift
//  ColoredView
//
//  Created by Yuriy on 17.02.2023.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.backgroundColor = view.backgroundColor
    }
}
