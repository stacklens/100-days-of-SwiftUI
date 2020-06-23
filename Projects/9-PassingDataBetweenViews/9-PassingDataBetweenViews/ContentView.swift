//
//  ContentView.swift
//  9-PassingDataBetweenViews
//
//  Created by 杜赛 on 2020/6/23.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor = 0
    @State private var showingDetail = false
    
    private let colors = [
        ("Red", Color.red),
        ("Blue", Color.blue),
        ("Orange", Color.orange)
    ]
    
    var body: some View {
        NavigationView {
            CustomPicker(selectedColor: $selectedColor, colors: colors)
            .navigationBarTitle("Passing data between views", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingDetail.toggle()
            })
            {
                Text("Detail")
            }
            .sheet(isPresented: $showingDetail) {
                Detail(selectedColor: self.$selectedColor, colors: self.colors)
                }
            )
        }
    }
}

struct Detail: View {
    @Binding var selectedColor: Int
    var colors: [(String, Color)]
    
    var body: some View {
        CustomPicker(selectedColor: $selectedColor, colors: colors)
    }
}

struct CustomPicker: View {
    @Binding var selectedColor: Int
    var colors: [(String, Color)]


    var body: some View {
        VStack {
            Picker(selection: $selectedColor, label: Text("choose a color")) {
                ForEach(0..<colors.count) {
                    Text(self.colors[$0].0)
                }
            }
            .labelsHidden()
            RoundedRectangle(cornerRadius: 10.0)
                .fill()
                .foregroundColor(self.colors[selectedColor].1)
                .frame(width: 50, height: 50)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
