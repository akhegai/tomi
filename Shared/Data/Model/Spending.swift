//
//  Spending.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation



public struct Spending: Codable, Identifiable {
    private static var idCounter = 0
    
    public var id: String
    public var amount: Double
    public var categoryId: String
    public var date: Date
    
    init(amount: Double, categoryId: String) {
        self.id = String(Spending.idCounter)
        self.amount = amount
        self.categoryId = categoryId
        self.date = Date()
        
        Spending.idCounter += 1
    }
}
