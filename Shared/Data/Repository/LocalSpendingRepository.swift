//
//  TomiCreateSpendingRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import Combine
import RealmSwift

public class LocalSpendingRepository: SpendingRepository {
    
    let realm = try! Realm()
    
    public func save(spending: Spending) -> AnyPublisher<Void, Error> {
        Future { promise in
            try! self.realm.write {
                self.realm.add(StorableSpending(spending))
            }
            return promise(.success(()))
        }.eraseToAnyPublisher()
    }

    public func getAll() -> AnyPublisher<[Spending], Error> {
        let spendings = realm.objects(StorableSpending.self)
        return RealmPublishers.collection(from: spendings).map { results in
            Array(results.map({ storable in
                storable.toModel()
            }))
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
