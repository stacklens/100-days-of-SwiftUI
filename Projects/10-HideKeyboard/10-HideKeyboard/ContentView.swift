//
//  ContentView.swift
//  10-HideKeyboard
//
//  Created by 杜赛 on 2020/6/23.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter something..", text: self.$text) {
                self.hideKeyboard()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(Font.system(size: 20))
            .disableAutocorrection(true)
            .frame(width: 300, height: nil)
            .padding()
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
#endif

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
