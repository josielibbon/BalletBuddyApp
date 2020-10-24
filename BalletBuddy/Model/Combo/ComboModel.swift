//
//  Combo.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import Foundation

struct ComboModel{
    var id: String!
    var title = ""
    var subtitle = ""
    var stepModels = [StepModel]()
    
    init(title: String, subtitle: String, data: [StepModel]?){
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let data = data{
            self.stepModels = data
        }
    }
    
}
