//
//  HomeView.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import SwiftUI

struct HomeView: View {
    var categoriesWithAmount: [(Category, Int)]
    
    var body: some View {
        NavigationView {
            List(categoriesWithAmount, id: \.0.id) { (category, amount) in
                NavigationLink(destination: NewSpendingView()) {
                    CategoryRowView(category: category, amount: amount)
                }
            }
                .navigationTitle("Мои интересы")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let categoriesWithAmount = [
            (Category(name: "Я"), 200),
            (Category(name: "Семья"), 200),
            (Category(name: "Мой дом"), 200),
            (Category(name: "Мое дело"), 200),
            (Category(name: "Хобби"), 200),
        ]
        HomeView(categoriesWithAmount: categoriesWithAmount)
    }
}
