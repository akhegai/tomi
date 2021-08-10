//
//  ContentView.swift
//  Shared
//
//  Created by Andrei Khegai on 23/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
