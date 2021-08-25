//
//  NewSpendingView.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import SwiftUI
import Resolver

struct NewSpendingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let category: Category
    @ObservedObject private var createSpendingViewModel = CreateSpendingViewModel()
    
    let date: Date
    let dateFormatter: DateFormatter
    
    init(category: Category) {
        self.category = category
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Введите сумму", text: $createSpendingViewModel.amount)
                .padding()
                .font(.largeTitle)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
            
            Button(action: self.createSpending, label: {
                Text("Создать")
            }).disabled(!self.createSpendingViewModel.isValid)
        }
        .navigationTitle(
            Text(date, formatter: dateFormatter)
        )
    }
    
    func createSpending() {
        self.createSpendingViewModel.createSpending(category: category)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NewSpendingView_Previews: PreviewProvider {
    static var previews: some View {
        NewSpendingView(category: Category(name: "Bla"))
    }
}
