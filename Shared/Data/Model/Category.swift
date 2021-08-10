//
//  Category.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation

public struct Category: Codable, Identifiable {
    private static var idCounter = 0
    
    public var id: String
    public var name: String
    
    init(name: String) {
        self.id = String(Category.idCounter)
        self.name = name
        
        Category.idCounter += 1
    }
}
