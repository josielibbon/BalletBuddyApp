//
//  UITextFieldExtension.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import UIKit

extension UITextField{
    var hasValue: Bool {
            guard text == "" else { return true }
            
            guard text != "", let _ = text else {
                layer.borderColor = UIColor.red.cgColor
                layer.borderWidth = 1
                layer.cornerRadius = 5
                return false
            }
            
          return false
        }
    }


