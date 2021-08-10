//
//  Period.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation

enum PeriodType {
    MONTH
}

struct Period: Codable, Identifiable {
    var id: String
    var from: Date
    var to: Date
    var type: PeriodType
}
