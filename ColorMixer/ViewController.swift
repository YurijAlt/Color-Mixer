//
//  ViewController.swift
//  ColorMixer
//
//  Created by SummeR on 25.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets:
    
    @IBOutlet weak var window: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    
    //MARK: - Life Cicle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Window settings
        
        window.layer.cornerRadius = 15
        
    }
    
    
    //MARK: - IB Actions:
    
    @IBAction func redSliderChanged() {
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        updateColor()
    }
    
    @IBAction func greenSliderChanged() {
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        updateColor()
    }
    
    @IBAction func blueSliderChanged() {
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
        updateColor()
    }
    
    
    
    //MARK: - Private Methods:
    
    private func updateColor() {
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        let colorOfWindow = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        window.backgroundColor = colorOfWindow
    }
    
}


