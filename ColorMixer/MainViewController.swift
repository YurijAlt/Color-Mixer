//
//  MainViewController.swift
//  ColorMixer
//
//  Created by Юрий Чекалюк on 08.04.2021.
//

import UIKit

protocol SetupViewControllerDelegate {
    func changeValues(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setupVC = segue.destination as? SetupViewController else { return }
        setupVC.color = view.backgroundColor
        setupVC.delegate = self
    }
    
}

extension MainViewController: SetupViewControllerDelegate {
    func changeValues(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat) {
        view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
}





