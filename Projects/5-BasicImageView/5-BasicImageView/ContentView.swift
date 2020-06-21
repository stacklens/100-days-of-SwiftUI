//
//  ContentView.swift
//  5-BasicImageView
//
//  Created by 杜赛 on 2020/6/21.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var completionAmount: CGFloat = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                CustomImage("star.fill", isSystemIcon: true)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .blue]),
                            startPoint: .top,
                            endPoint: .bottom
                    ))
                CustomImage("cloud.heavyrain.fill", isSystemIcon: true)
                CustomImage("heart.fill", isSystemIcon: true)
            }
            .padding()
            .foregroundColor(Color.yellow)
            
            HStack {
                CustomImage("corn-on-the-cob-thumb")
                CustomImage("pepperoni-pizza-thumb")
                CustomImage("veggie-pizza-thumb")
            }
            .padding()
            
            HStack {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 60, height: 60)
                    .padding()
                Circle()
                .trim(from: 0, to: completionAmount)
                    .stroke(Color.red, lineWidth: 10)
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(-90))
                    .onReceive(timer) { _ in
                        withAnimation {
                            guard self.completionAmount < 1 else { return }
                            self.completionAmount += 0.04
                        }
                }
            }
            .padding()
        }
    }
}

struct CustomImage: View {
    let name: String
    var isSystemIcon: Bool
    
    init(_ name: String, isSystemIcon: Bool = false) {
        self.name = name
        self.isSystemIcon = isSystemIcon
    }
    
    var body: some View {
        Group {
            if isSystemIcon {
                Image(systemName: name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            else {
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


