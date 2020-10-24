//
//  UIViewController.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//



import UIKit

extension UIViewController{
    
    /**
        Just returns the initial view controller on a storyboard
     */
    
    
static func getInstance() -> UIViewController {
    let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
    return storyboard.instantiateInitialViewController()!
    
    }
}
