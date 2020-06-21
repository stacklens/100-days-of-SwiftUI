//
//  ContentView.swift
//  3-TipCalculator
//
//  Created by 杜赛 on 2020/6/21.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var priceStr = ""
    @State private var percent: Float = 0
    
    var body: some View {
        VStack {
            TextField("$0.00", text: $priceStr)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(Font.system(size: 30))
                .disableAutocorrection(true)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .frame(width: 180, height: nil)
                .padding()
            Group {
                Text("Tap(\(percent.format2f)%): $\(tips().format2f)")
                Text("Total: $\((priceStr.toFloat + tips()).format2f)")
            }
            Slider(value: $percent, in: 0...100, step: 0.01)
                .frame(width: 200, height: nil)
        }
            
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
    private func tips() -> Float {
        return priceStr.toFloat * percent / 100
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Float {
    var format2f: String {
        String(format: "%.2f", self)
    }
}

extension String {
    var toFloat: Float {
        return Float(self) ?? 0
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
