//
//  ClassModel.swift
//  BalletBuddy
//
//  Created by Josie Libbon on 10/23/20.
//

import Foundation

class ClassModel{
    var id: String!
    var title: String!
    
    init(title: String){
        
        id = UUID().uuidString
        self.title = title
    }
}
