//
//  StorableSpending.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 22/8/21.
//

import Foundation
import RealmSwift

class StorableSpending: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var amount: Double
    @Persisted var categoryId: String
    @Persisted var date: Date
    
    convenience init(amount: Double, categoryId: String, date: Date) {
        self.init()
        self.amount = amount
        self.categoryId = categoryId
        self.date = date
    }
    
    convenience init(_ spending: Spending) {
        self.init()
        self.amount = spending.amount
        self.categoryId = spending.categoryId
        self.date = spending.date
    }
    
    func toModel() -> Spending {
        return Spending(id: self.id.stringValue, amount: self.amount, categoryId: self.categoryId, date: self.date)
    }
}
