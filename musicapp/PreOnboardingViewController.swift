//
//  PreOnboardingViewController.swift
//  musicapp
//
//  Created by Олександр Олійник on 19.07.2022.
//

import UIKit

class PreOnboardingViewController: UIViewController {
    
    @IBAction func preOnboardingButtonPressed(_ sender: Any) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "OnboardingViewController") as? UIViewController else { return }
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        show(controller, sender: nil)
    }
}



