//
//  Step.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import Foundation

import UIKit

struct StepModel{
    var id: String!
    var title = ""
    var subtitle = ""
    var stepType: StepType
    
    init(title: String, subtitle: String, stepType: StepType){
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        self.stepType = stepType
    
    }
    
}
