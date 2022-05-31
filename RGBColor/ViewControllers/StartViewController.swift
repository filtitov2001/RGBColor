//
//  StartViewController.swift
//  SettingsColor
//
//  Created by Felix Titov on 07.02.2022.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for color: UIColor?)
}

class StartViewController: UIViewController {    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.color = view.backgroundColor
    }

}

extension StartViewController: SettingsViewControllerDelegate {
    func setNewValues(for color: UIColor?) {
        view.backgroundColor = color
    }
    
    
}
