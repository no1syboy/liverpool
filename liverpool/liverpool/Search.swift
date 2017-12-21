//
//  Search.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import Foundation

class Search {
    
    var id: Int64?
    var name: String?
   
    
    init(id: Int64) {
        self.id = id
        
    }
    
    init(id: Int64, name: String) {
        
        self.id = id
        self.name = name
        
    }
}
