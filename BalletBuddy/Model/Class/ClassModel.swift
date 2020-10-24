//
//  ClassModel.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import Foundation

struct ClassModel{
    let id: UUID
    var title: String
    var comboModels = [ComboModel]()
    
    init(title: String, comboModels: [ComboModel]? = nil){
        
        id = UUID()
        self.title = title

        if let comboModels = comboModels{
            self.comboModels = comboModels
        }
    }
}
