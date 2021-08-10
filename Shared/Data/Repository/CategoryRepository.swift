//
//  CategoryRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import RxSwift

public protocol CategoryRepository {
    func saveCategory(cat: Category) -> Single<Void>
    
    func getCategories() -> Observable<[Category]>
}
