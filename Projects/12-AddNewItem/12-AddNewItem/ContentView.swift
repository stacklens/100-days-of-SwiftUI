//
//  ContentView.swift
//  12-AddNewItem
//
//  Created by 杜赛 on 2020/7/11.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var foods = [Food]()
    @State private var showingDetail = false
    
    var body: some View {
        NavigationView {
            List(foods) { food in
                Text(food.name)
            }
            .font(Font.system(size: 40))
            .navigationBarTitle("Foods", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingDetail.toggle()
            })
            {
                Image(uiImage: UIImage(systemName: "plus.circle")!)
            }
            .sheet(isPresented: $showingDetail)
            {
                Detail(foods: self.$foods)
                }
            )
        }
    }
}

struct Detail: View {
    @Binding var foods: [Food]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        let emojis = "🥐🥨🥞🥩🍔🥙🥗🍙🥮".map { String($0) }
        return ScrollView(.horizontal) {
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .font(Font.system(size: 40))
                        .onTapGesture {
                            self.foods.append(Food(emoji))
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
        }
    }
}

struct Food: Identifiable {
    let id = UUID()
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
