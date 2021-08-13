//
//  HomeViewModel.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 13/8/21.
//

import Foundation
import Resolver
import Combine

class HomeViewModel: ObservableObject {
    var spendingRepository: SpendingRepository = Resolver.resolve()
    var categoryRepository: CategoryRepository = Resolver.resolve()
    
    // output
    @Published() var items: [(Category, Int)] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        itemsArrangePublisher
            .receive(on: RunLoop.main)
            .replaceError(with: [])
            .assign(to: \.items, on: self)
            .store(in: &cancellableSet)
    }
}

extension HomeViewModel {
    private var itemsArrangePublisher: AnyPublisher<[(Category, Int)], Error> {
        Publishers.CombineLatest(spendingRepository.getGroupedByCategory(), categoryRepository.getCategories())
            .receive(on: RunLoop.main)
            .mapError { err1 in
                return err1
            }
            .map(self.arrangeItems)
            .eraseToAnyPublisher()
        
    }
    
    private func arrangeItems(spendingsByCategory: [String : [Spending]], categories: [Category]) -> [(Category, Int)] {
        let items: [(Category, Int)] = categories.map { cat in
            if let sum = spendingsByCategory[cat.id]?.reduce(0, { acc, spending in
                acc + Int(spending.amount)
            }) {
                return (cat, sum)
            }
            return (cat, 0)
        }
        print(items)
        return items
    }
}
