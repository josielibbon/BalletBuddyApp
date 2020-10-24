//
//  UIButtonExtensions.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import UIKit

extension UIButton{
    func createFloatingActionButton(){
        
        layer.cornerRadius = frame.height / 2
        backgroundColor = Theme.tintColor
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
        
    }
}
