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
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.classModels.count == 0{
                Data.classModels = MockData.createMockClassData()
            }
        
    
            DispatchQueue.main.async{
                completion()
            }
        }
    }
    
    static func readClass(by id: UUID, completion: @escaping (ClassModel?) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            let classes = Data.classModels.first(where: { $0.id == id })
            DispatchQueue.main.async {
                completion(classes)
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
