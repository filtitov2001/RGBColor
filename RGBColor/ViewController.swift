//
//  ViewController.swift
//  RGBColor
//
//  Created by Феликс Титов on 22.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorPaletteLabel: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    

    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSliderLoad()
        greenSliderLoad()
        blueSliderLoad()
        paletteLabelLoad()
    }
    

    @IBAction func changeRedValue() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        colorPaletteLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
    }
    
    
    @IBAction func changeGreenValue() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        colorPaletteLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    
    @IBAction func changeBlueValue() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        colorPaletteLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
}

//MARK: Load main interface's elements
extension ViewController {
    private func redSliderLoad() {
        redSlider.value = 0.05
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        redSlider.tintColor = .red
        redValueLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    private func greenSliderLoad() {
        greenSlider.value = 0.27
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        greenSlider.tintColor = .green
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        
    }
    
    private func blueSliderLoad() {
        blueSlider.value = 0.49
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
        blueSlider.tintColor = .blue
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        
    }
    
    private func paletteLabelLoad() {
        colorPaletteLabel.layer.cornerRadius = 15
        let startColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        colorPaletteLabel.backgroundColor = startColor
    }
    
}
