//
//  TomiCreateSpendingRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import RxSwift

public class LocalSpendingRepository: SpendingRepository {
    private var storage: [Spending] = []

    public func save(spending: Spending) -> Single<Void> {
        return Single<Void>.create { single in
            self.storage.append(spending)
            single(.success(()))
            return Disposables.create {}
        }
    }
}
