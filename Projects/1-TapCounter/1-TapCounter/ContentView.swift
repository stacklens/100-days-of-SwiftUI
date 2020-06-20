//
//  ContentView.swift
//  1-TapCounter
//
//  Created by 杜赛 on 2020/6/20.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(count)")
                    .font(Font.system(size: 80))
                    .padding()
                Button(action: { self.count += 1 }) {
                    Text("Tap")
                        .font(.largeTitle)
                }
            }
            .navigationBarTitle("Tap Counter", displayMode: .inline)
            .navigationBarItems(
                leading:
                Button("Reset") {
                    self.count = 0
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
