//
//  CreateSpendingViewModel.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 10/8/21.
//

import Foundation
import Resolver
import Combine


class CreateSpendingViewModel: ObservableObject {
    var spendingRepository: SpendingRepository = Resolver.resolve()
    
    // input
    @Published var amount = ""
    
    // output
    @Published var isValid = false
    @Published var isCreated = false
    @Published var spendings = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    
    init() {
        isAmountValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancellableSet)
    }
}

extension CreateSpendingViewModel {
    private var isAmountValidPublisher: AnyPublisher<Bool, Never> {
        $amount
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                Double(input) != nil
            }
            .eraseToAnyPublisher()
    }
    
    func createSpending(category: Category) {
        spendingRepository.save(spending: Spending(amount: Double(self.amount)!, categoryId: category.id, date: Date()))
            .receive(on: RunLoop.main)
            .map({ true })
            .replaceError(with: false)
            .assign(to: \.isCreated, on: self)
            .store(in: &cancellableSet)
    }
    
}

