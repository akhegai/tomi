//
//  NewSpendingView.swift
//  tomi (iOS)
//
//  Created by Andrei Khegai on 23/7/21.
//

import SwiftUI
import Introspect

struct NewSpendingView: View {
    let date: Date
    let dateFormatter: DateFormatter
    
    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Введите сумму", text: .constant(""))
                .padding()
                .font(.largeTitle)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
            Button(action: {}, label: {
                Text("Создать")
            })
        }
        .navigationTitle(
            Text(date, formatter: dateFormatter)
        )
    }
}

struct NewSpendingView_Previews: PreviewProvider {
    static var previews: some View {
        NewSpendingView()
    }
}
