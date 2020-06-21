//
//  ContentView.swift
//  2-HoldCounter
//
//  Created by 杜赛 on 2020/6/21.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var lastPressTime = Date().timeIntervalSince1970
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(count)")
                    .font(Font.system(size: 80))
                Text("Hold")
                    .foregroundColor(Color.blue)
                    .padding()
                    .font(Font.largeTitle)
                    .gesture(
                        // Use DragGesture simulate LongPressGesture
                        DragGesture()
                            .onChanged{ _ in
                                let currentPressTime = Date().timeIntervalSince1970
                                // Counter increase once per 0.1 second
                                if currentPressTime - self.lastPressTime > 0.1 {
                                    self.lastPressTime = currentPressTime
                                    self.count += 1
                                }
                        }
                )
            }
            .navigationBarTitle("Hold", displayMode: .inline)
            .navigationBarItems(
                leading:
                Button(action: { self.count = 0 }) {
                    Text("Reset")
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
