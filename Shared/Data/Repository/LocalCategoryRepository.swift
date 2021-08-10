//
//  LocalCategoryRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import RxSwift

public class LocalCategoryRepository: CategoryRepository {
    var storage: [Category] = []
    
    public func saveCategory(cat: Category) -> Single<Void> {
        return Single<Void>.create { single in
            self.storage.append(cat)
            single(.success(()))
            return Disposables.create {}
        }
    }
    
    public func getCategories() -> Observable<[Category]> {
        return Observable.just(self.storage)
    }
    
}
