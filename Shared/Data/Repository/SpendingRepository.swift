//
//  CreateSpendingRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import Combine

public protocol SpendingRepository {
    func save(spending: Spending) -> AnyPublisher<Void, Error>
    
    func getAll() -> AnyPublisher<[Spending], Error>
    
    func getGroupedByCategory() -> AnyPublisher<[String : [Spending]], Error>
}
