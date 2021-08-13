//
//  CategoryRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import Combine

public protocol CategoryRepository {
    func saveCategory(cat: Category) -> AnyPublisher<Void, Error>
    
    func getCategories() -> AnyPublisher<[Category], Error>
}
