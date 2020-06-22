//
//  ContentView.swift
//  7-ViewsAndControls
//
//  Created by 杜赛 on 2020/6/22.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ToggleView()
            Divider()
            ButtonView()
            Divider()
            SecureFieldView()
            Spacer()
        }
        
    }
}

struct SecureFieldView: View {
    @State private var password = ""
    
    var body: some View {
        VStack {
            SecureField("Enter a password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .keyboardType(.numberPad)
                .frame(width: 180, height: nil)
            Text("You entered: \(password)")
        }
    }
}

struct ButtonView: View {
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showDetail.toggle()
            }) {
                Text("Show detail")
            }
            
            if showDetail {
                Text("More detail here").padding()
            } else {
                Text("...").padding()
            }
        }
    }
}

struct ToggleView: View {
    @State private var showGreeting = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting) {
                Text("Show message")
            }
            .padding(.leading)
            .padding(.trailing)
            if showGreeting {
                Text("Hello World!")
            } else {
                Text("...")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
