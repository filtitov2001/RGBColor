//
//  SettingsViewController.swift
//  SettingsColor
//
//  Created by Felix Titov on 01.02.2022.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit


class SettingsViewController: UIViewController {


    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet var redValueTextField: UITextField!
    @IBOutlet var greenValueTextField: UITextField!
    @IBOutlet var blueValueTextField: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redColorValueLabel: UILabel!
    @IBOutlet var greenColorValueLabel: UILabel!
    @IBOutlet var blueColorValueLabel: UILabel!
    
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.translatesAutoresizingMaskIntoConstraints = true
        setupColorView()
        setupSliders()
        setupColorLabels()
        setupTextFields()
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func changeSliderValue(_ sender: UISlider) {
        switch sender {
            case redSlider:
                redColorValueLabel.text = String(format: "%.2f", redSlider.value)
                redValueTextField.text = String(format: "%.2f", redSlider.value)
            case greenSlider:
                greenColorValueLabel.text = String(format: "%.2f", greenSlider.value)
                greenValueTextField.text = String(format: "%.2f", greenSlider.value)
            default:
                blueColorValueLabel.text = String(format: "%.2f", blueSlider.value)
                blueValueTextField.text = String(format: "%.2f", blueSlider.value)
        }
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewValues(for: colorView.backgroundColor)
        dismiss(animated: true)
    }
}


//MARK: Setup start screen
extension SettingsViewController {
    private func setupColorView() {
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = color
        colorView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSliders() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        setSliderColor()
    }
    
    private func setupColorLabels() {
        redColorValueLabel.text = getCorrectSliderValue(from: redSlider)
        greenColorValueLabel.text = getCorrectSliderValue(from: greenSlider)
        blueColorValueLabel.text = getCorrectSliderValue(from: blueSlider)
        
    }
    
    private func setupTextFields() {
        redValueTextField.text = getCorrectSliderValue(from: redSlider)
        greenValueTextField.text = getCorrectSliderValue(from: greenSlider)
        blueValueTextField.text = getCorrectSliderValue(from: blueSlider)
        
        redValueTextField.addDoneButtonOnKeyboard()
        greenValueTextField.addDoneButtonOnKeyboard()
        blueValueTextField.addDoneButtonOnKeyboard()

        redValueTextField.delegate = self
        greenValueTextField.delegate = self
        blueValueTextField.delegate = self
    }
    
    private func getCorrectSliderValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSliderColor() {
        let ciColor = CIColor(color: color)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
}

//MARK: Work with keyboard
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let inputValue = textField.text else {return}
        guard let floatValue = Float(inputValue) else {return}
        
        switch textField {
        case redValueTextField:
            redSlider.setValue(floatValue, animated: true)
            redColorValueLabel.text = redValueTextField.text
        case greenValueTextField:
            greenSlider.value = floatValue
            greenColorValueLabel.text = greenValueTextField.text
        default:
            blueSlider.value = floatValue
            blueColorValueLabel.text = blueValueTextField.text
        }
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
}

//MARK: Create Done button on toolbar for numeric pad
extension UITextField {
   func addDoneButtonOnKeyboard() {
       let keyboardToolbar = UIToolbar()
       
       let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
           target: nil, action: nil)
       let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
           target: self, action: #selector(resignFirstResponder))
       keyboardToolbar.items = [flexibleSpace, doneButton]
       keyboardToolbar.sizeToFit()
       self.inputAccessoryView = keyboardToolbar
       
   }
}
