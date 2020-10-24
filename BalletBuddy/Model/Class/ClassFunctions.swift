//
//  ClassFunctions.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import UIKit

class ClassFunctions{
    
    static func createClass(classModel: ClassModel){
        Data.classModels.append(classModel)
    }
    
    static func readClass(completion: @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
            
        
        if Data.classModels.count == 0 {
            Data.classModels.append(ClassModel(title: "Children's Beginning"))
            Data.classModels.append(ClassModel(title: "Children's Intermediate"))
            Data.classModels.append(ClassModel(title: "Children's Advanced"))
            
            }
            DispatchQueue.main.async{
                completion()
            }
        }
    }
    
    static func updateClass(at index: Int, title: String, image: UIImage? = nil){
        Data.classModels[index].title = title
        
    }
    
    static func deleteClass(index: Int){
        Data.classModels.remove(at: index)
        
    }
}
