//
//  ContentView.swift
//  4-TextFotmatter
//
//  Created by 杜赛 on 2020/6/21.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @State private var date = Date()
    
    var body: some View {
        VStack {
            Text("Current DateTime:")
                .kerning(5)
                //.tracking(5)
            Text("\(date, formatter: Self.dateFormat)")
                .font(Font.headline)
                .padding()
            Button("Refresh") { self.date = Date() }
                .frame(width: 100, height: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
