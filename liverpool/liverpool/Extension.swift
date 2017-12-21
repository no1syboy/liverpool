//
//  Extension.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import Foundation

extension String {
    mutating func trim() -> String
    {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func clearForUrl() -> String
    {
        return self.replacingOccurrences(of: " ", with: "+")
    }
}
