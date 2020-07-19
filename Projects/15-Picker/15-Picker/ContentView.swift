//
//  ContentView.swift
//  15-Picker
//
//  Created by 杜赛 on 2020/7/19.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    
    private let foods: [String?] = [nil, "Apple", "Banana", "Orange", "Milk"]
    @State var selectedFood = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                        Text("Date")
                    }
                    
                    Picker("Food", selection: $selectedFood) {
                        // Text("Any").tag(String?.none)
                        ForEach(0..<foods.count) {
                            Text(self.foods[$0] ?? "Any")
                        }
                    }
                }
                .navigationBarTitle("Picker")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
