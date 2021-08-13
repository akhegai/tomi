//
//  TomiCreateSpendingRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import Combine

private var storage: [Spending] = []

public class LocalSpendingRepository: SpendingRepository {
    

    public func save(spending: Spending) -> AnyPublisher<Void, Error> {
        Future { promise in
            storage.append(spending)
            return promise(.success(()))
        }.eraseToAnyPublisher()
    }
    
    public func getAll() -> AnyPublisher<[Spending], Error> {
        Future { promise in
            return promise(.success(storage))
        }.eraseToAnyPublisher()
    }
    
    public func getGroupedByCategory() -> AnyPublisher<[String : [Spending]], Error> {
        self.getAll()
            .map({ storage in
                var groupedSpending = [String: [Spending]]()
                for spending in storage {
                    if (groupedSpending.keys.contains(spending.categoryId)) {
                        groupedSpending[spending.categoryId]! += [spending]
                    } else {
                        groupedSpending[spending.categoryId] = [spending]
                    }
                }
                return groupedSpending
            }).eraseToAnyPublisher()
    }
}
