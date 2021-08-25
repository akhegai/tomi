//
//  Spending.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation



public struct Spending: Codable, Identifiable {
    public var id: String?
    public var amount: Double
    public var categoryId: String
    public var date: Date
}
