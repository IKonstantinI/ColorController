//
//  MainViewController.swift
//  ColorController
//
//  Created by horze on 09.12.2023.
//

import UIKit

protocol ColorUpdaterDelegate: AnyObject {
    func didSelectColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    
    private var backgroundColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsVC = segue.destination as? SettingsViewController {
            settingsVC.delegate = self
            settingsVC.initialColor = backgroundColor
        }
    }
}

extension MainViewController: ColorUpdaterDelegate {
    func didSelectColor(_ color: UIColor) {
        backgroundColor = color
        view.backgroundColor = color
    }
}
