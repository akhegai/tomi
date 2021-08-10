//
//  CreateSpendingRepository.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import Foundation
import RxSwift

public protocol SpendingRepository {
    func save(spending: Spending) -> Single<Void>
}
