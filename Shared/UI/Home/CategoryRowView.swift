//
//  CategoryRowView.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import SwiftUI

struct CategoryRowView: View {
    var category: Category
    var amount: Int
    
    var body: some View {
        HStack {
            Text(category.name)
            Spacer()
            Text(String(amount))
        }
        .padding(.horizontal, 8.0)
        .padding(.vertical, 11.0)
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: Category(name: "Я"), amount: 200)
    }
}
