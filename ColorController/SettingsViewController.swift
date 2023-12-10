//
//  ViewController.swift
//  ColorController
//
//  Created by horze on 17.11.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    weak var delegate: ColorUpdaterDelegate?
    
    var initialColor: UIColor?
    
    @IBOutlet var resultColorView: UIView!
    
    @IBOutlet var redPointLabel: UILabel!
    @IBOutlet var greenPointLabel: UILabel!
    @IBOutlet var bluePointLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultColorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        if let initialColor = initialColor {
            let components = initialColor.cgColor.components
            redSlider.value = Float(components?[0] ?? 0.0)
            greenSlider.value = Float(components?[1] ?? 0.0)
            blueSlider.value = Float(components?[2] ?? 0.0)
        }
        
        updateResultColorView()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redPointLabel.text = String(format: "%.2f", sender.value)
        case 1:
            greenPointLabel.text = String(format: "%.2f", sender.value)
        case 2:
            bluePointLabel.text = String(format: "%.2f", sender.value)
        default:
            break
        }
        
        updateResultColorView()
    }
    
    private func updateResultColorView() {
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        
        let updatedColor = UIColor(
            red: redColor,
            green: greenColor,
            blue: blueColor,
            alpha: 1.0
        )
        
        resultColorView.backgroundColor = updatedColor
        delegate?.didSelectColor(updatedColor)
    }
}

