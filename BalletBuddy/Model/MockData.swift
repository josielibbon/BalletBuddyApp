//
//  MockData.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/24/20.
//

import Foundation

class MockData{
    static func createMockClassData() -> [ClassModel]{
    var mockClass = [ClassModel]()
        mockClass.append(ClassModel(title: "Children's Beginning", comboModels: createMockComboData()))
        mockClass.append(ClassModel(title: "Advanced"))
        return mockClass
    }
    
    
    static func createMockComboData() -> [ComboModel]{
        var comboModels = [ComboModel]()
        comboModels.append(ComboModel(title: "Frappe", subtitle: "Barre", data: createMockStepData(sectionTitle: "Frappe")))
        comboModels.append(ComboModel(title: "Adagio", subtitle: "Centre", data: createMockStepData(sectionTitle: "Adagio")))
        return comboModels
    }
    
    static func createMockStepData(sectionTitle: String) -> [StepModel]{
        var stepModels = [StepModel]()
        switch sectionTitle{
        case "Frappe":
            stepModels.append(StepModel(title: "Strike Front", subtitle: "2 counts", stepType: StepType.barre))
            stepModels.append(StepModel(title: "Strike Side", subtitle: "2 counts", stepType: StepType.barre))
        case "Adagio":
            stepModels.append(StepModel(title: "Develop Front", subtitle: "3 Counts", stepType: StepType.centre ))
            stepModels.append(StepModel(title: "Promenade", subtitle: "6 counts", stepType: StepType.centre))
        default:
            stepModels.append(StepModel(title: "", subtitle: "", stepType: StepType.barre))
                               
            }
           return stepModels
    
    }
    
}
