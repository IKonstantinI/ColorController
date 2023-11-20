//
//  ViewController.swift
//  ColorController
//
//  Created by horze on 17.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var resultColorView: UIView!
    
    @IBOutlet var redNameLabel: UILabel!
    @IBOutlet var greenNameLabel: UILabel!
    @IBOutlet var blueNameLabel: UILabel!
    
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
        
        updateResultColorView()
    }
    
    @IBAction func redSliderAction() {
        redPointLabel.text = String(format: "%.2f", redSlider.value)
        updateResultColorView()
    }
    
    @IBAction func greenSliderAction() {
        greenPointLabel.text = String(format: "%.2f", greenSlider.value)
        updateResultColorView()
    }
    
    @IBAction func blueSliderAction() {
        bluePointLabel.text = String(format: "%.2f", blueSlider.value)
        updateResultColorView()
    }
    
    private func updateResultColorView() {
        let redColor = CGFloat(redSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        
        resultColorView.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}

