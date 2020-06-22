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
            Group {
                ToggleView()
                Divider()
                ButtonView()
                Divider()
                //                SecureFieldView()
                //                Divider()
            }
            
            PickerView()
            Divider()
            SegmentPickerView()
            Divider()
            StepperView()
            Spacer()
        }
        
    }
}

struct StepperView: View {
    @State private var age = 18
    
    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)").font(.headline)
        }
    }
}

struct SegmentPickerView: View {
    @State private var favoriteColor = 0
    var colors = ["Red", "Green", "Blue"]
    
    var body: some View {
        VStack {
            Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                ForEach(0..<colors.count) { index in
                    Text(self.colors[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Text("Value: \(colors[favoriteColor])")
        }
    }
}

struct PickerView: View {
    private var colors = ["Red", "Green", "Blue", "Orange"]
    @State private var selectedColor = 0
    
    var body: some View {
        VStack {
            Picker("choose", selection: $selectedColor) {
                ForEach(0..<colors.count) {
                    Text(self.colors[$0])
                }
            }
            .labelsHidden()
            .padding(.trailing)
            Text("You selected: \(colors[selectedColor])")
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
