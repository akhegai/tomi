//
//  HomeView.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List(homeViewModel.items, id: \.0.id) { (category, amount) in
                NavigationLink(destination: NewSpendingView(category: category)) {
                    CategoryRowView(category: category, amount: amount)
                }
            }
                .navigationTitle("Мои интересы")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
