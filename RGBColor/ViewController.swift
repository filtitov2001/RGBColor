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
    
    @IBOutlet var redValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 0.05
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        paletteLabelLoad()
    }
    
    
    
    private func paletteLabelLoad() {
        colorPaletteLabel.layer.cornerRadius = 15
        let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        colorPaletteLabel.backgroundColor = startColor
    }

    @IBAction func changeRedValue() {
        redValueLabel.text = String(format: "%.2f",redSlider.value)
        
    }
    
    
}

