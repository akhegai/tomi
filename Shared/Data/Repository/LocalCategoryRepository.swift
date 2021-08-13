//
//  LocalCategoryRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import Combine

private var storage: [Category] = [
    Category(name: "Я"),
    Category(name: "Семья"),
    Category(name: "Мой дом"),
    Category(name: "Мое дело"),
    Category(name: "Хобби"),
]

public class LocalCategoryRepository: CategoryRepository {
    public func saveCategory(cat: Category) -> AnyPublisher<Void, Error> {
        return Future { promise in
            storage.append(cat)
            return promise(.success(()))
        }.eraseToAnyPublisher()
    }
    
    public func getCategories() -> AnyPublisher<[Category], Error> {
        return Future { promise in
            return promise(.success(storage))
        }.eraseToAnyPublisher()
    }
    
}
