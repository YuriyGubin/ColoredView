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
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var blueValueTF: UITextField!
    
    var viewColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupElements()
        setValue()
        setColor()
        initDelegatesForTextFields()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    //MARK: - IBActions
    @IBAction func sliderAction(_ sender: UISlider) {
        
        setColor()
        
        switch sender{
        case redSlider:
            redValueLabel.text = string(from: sender)
            redValueTF.text = string(from: sender)
        case greenSlider:
            greenValueLabel.text = string(from: sender)
            greenValueTF.text = string(from: sender)
        default:
            blueValueLabel.text = string(from: sender)
            blueValueTF.text = string(from: sender)
        }
    }
    
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setViewBackground(
            withColor: coloredView.backgroundColor ?? .white
        )
        dismiss(animated: true)
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
        
        let ciColor = CIColor(color: viewColor)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
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
        
        redValueTF.text = string(from: redSlider)
        greenValueTF.text = string(from: greenSlider)
        blueValueTF.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func initDelegatesForTextFields() {
        redValueTF.delegate = self
        greenValueTF.delegate = self
        blueValueTF.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(withTitle: "Wrong format!", andMessage: "Please enter correct value")
            return
        }
        guard let currentValue = Float(text), (0...1).contains(currentValue) else {
            showAlert(
                withTitle: "Wrong format!",
                andMessage: "Please enter correct value",
                textField: textField
            )
            return
        }
        switch textField {
        case redValueTF:
            redSlider.setValue(currentValue, animated: true)
            redValueLabel.text = string(from: redSlider)
        case greenValueTF:
            greenSlider.setValue(currentValue, animated: true)
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueSlider.setValue(currentValue, animated: true)
            blueValueTF.text = string(from: blueSlider)
        }
        setColor()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

// MARK: - Set Alert
extension SettingsViewController {
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


