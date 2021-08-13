//
//  DataResolverRegistration.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 10/8/21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { LocalSpendingRepository() as SpendingRepository }
        register { LocalCategoryRepository() as CategoryRepository }
    }
}
