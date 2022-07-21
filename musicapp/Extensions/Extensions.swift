//
//  eExtensions.swift
//  musicapp
//
//  Created by Олександр Олійник on 20.07.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func checkValid(arr: [UITextField]) -> String? {
        for field in arr {
            if field.text == "" || field.text == nil{
                return "Please fill in all alerts"
            }
        }
        return nil
    }
}
