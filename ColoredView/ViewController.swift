//
//  ViewController.swift
//  ColoredView
//
//  Created by Yuriy on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
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
    }

    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redValueLabel.text = String(format: "%.2f", sender.value)
        case 1:
            greenValueLabel.text = String(format: "%.2f", sender.value)
        default:
            blueValueLabel.text = String(format: "%.2f", sender.value)
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
}

