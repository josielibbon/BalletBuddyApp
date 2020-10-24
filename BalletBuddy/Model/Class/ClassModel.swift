//
//  ClassModel.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import Foundation

class ClassModel{
    let id: UUID
    var title: String
    
    init(title: String){
        
        id = UUID()
        self.title = title
    }
}
