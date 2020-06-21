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
            Text("\(date, formatter: Self.dateFormat)")
                .font(Font.headline)
            Button("Refresh") { self.date = Date() }
                .padding()
                .frame(width: 100, height: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
