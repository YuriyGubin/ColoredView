//
//  SettingsViewController.swift
//  ColoredView
//
//  Created by Yuriy on 10.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var coloredView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setValue()
        setColor()
    }

    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        
        setColor()
        
        switch sender{
        case redSlider:
            redValueLabel.text = string(from: sender)
        case greenSlider:
            greenValueLabel.text = string(from: sender)
        default:
            blueValueLabel.text = string(from: sender)
        }
    }
    
    //MARK: - Private methods
    private func setupElements() {
        coloredView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .red.withAlphaComponent(0.2)
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .green.withAlphaComponent(0.2)
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .blue.withAlphaComponent(0.2)
    }
    
    private func setColor() {
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue() {
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

