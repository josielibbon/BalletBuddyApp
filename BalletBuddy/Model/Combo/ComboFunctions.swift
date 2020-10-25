//
//  ComboFunctions.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import Foundation

class ComboFunctions {
    static func createCombo(at classIndex: Int, using comboModel: ComboModel) {
        // Replace with real data store code
        
        Data.classModels[classIndex].comboModels.append(comboModel)
    }
    
}
