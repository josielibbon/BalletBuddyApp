//
//  StepFunctions.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import Foundation

class StepFunctions {
    static func createStep(at classIndex: Int, for comboIndex: Int, using stepModel: StepModel) {
        // Replace with real data store code
       
        Data.classModels[classIndex].comboModels[comboIndex].stepModels.append(stepModel)
    }
    
    
}
