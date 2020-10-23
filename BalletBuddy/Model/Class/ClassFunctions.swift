//
//  ClassFunctions.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import Foundation

class ClassFunctions{
    
    static func createClass(classModel: ClassModel){
        
        
    }
    
    static func readClass(completion: @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            
        }
        if Data.classModels.count == 0 {
            Data.classModels.append(ClassModel(title: "Children's Beginning"))
            Data.classModels.append(ClassModel(title: "Children's Intermediate"))
            Data.classModels.append(ClassModel(title: "Children's Advanced"))
        }
        DispatchQueue.main.async{
            completion()
        }
    }
    
    static func updateClass(classModel: ClassModel){
        
        
    }
    
    static func deleteClass(classModel: ClassModel){
        
        
    }
}
