//
//  ViewController.swift
//  ColorMixer
//
//  Created by SummeR on 25.03.2021.
//

import UIKit

class SetupViewController: UIViewController {
    
    //MARK: - IB Outlets:
    @IBOutlet weak var window: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet weak var redColorTextField: UITextField!
    @IBOutlet weak var greenColorTextField: UITextField!
    @IBOutlet weak var blueColorTextField: UITextField!
    
    //MARK: Public Properties
    var color: UIColor!
    var delegate: SetupViewControllerDelegate!
    
    //MARK: - Life Cicle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        window.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        window.backgroundColor = color
        setSliderValue()
        setValue(for: redColorLabel, greenColorLabel, blueColorLabel)
//        setValueForTF(for: redColorTextField, greenColorTextField, blueColorTextField)
        
    }
    
    //MARK: - IB Actions:
    @IBAction func rgbSlidersColor(_ sender: UISlider) {
        updateColor()
        switch sender {
        case redSlider: setValue(for: redColorLabel)
        case greenSlider: setValue(for: greenColorLabel)
        default: setValue(for: blueColorLabel)
        }
    }
    
    
    @IBAction func doneButtonPressed() {
        delegate.changeValues(redColor: CGFloat(redSlider.value), greenColor: CGFloat(greenSlider.value), blueColor: CGFloat(blueSlider.value))
        dismiss(animated: true)
    }

    //MARK: - Private Methods:
    private func updateColor() {
        window.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorLabel:
                label.text = string(from: redSlider)
            case greenColorLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
//    private func setValueForTF(for textFields: UITextField...) {
//        textFields.forEach { textField in
//            switch textField {
//            case redColorTextField:
//                textField.text = string(from: redSlider)
//            case greenColorTextField:
//                textField.text = string(from: greenSlider)
//            default:
//                textField.text = string(from: blueSlider)
//            }
//        }
//    }
    
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setSliderValue() {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        }

}

//MARK: - Keyboard settings
extension SetupViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}






