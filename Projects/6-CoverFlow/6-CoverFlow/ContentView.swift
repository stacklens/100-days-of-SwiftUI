//
//  ContentView.swift
//  6-CoverFlow
//
//  Created by 杜赛 on 2020/6/22.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    CoverFlowView()
                }
            }
            PerspectiveView()
        }

    }
}


struct CoverFlowView: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(1..<10) { num in
                VStack {
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.orange)
                            .rotation3DEffect(
                                .degrees(-Double(geo.frame(in: .global).minX) / 8),
                                axis: (x: 0, y: 1, z: 0)
                        )
                    }
                }
                .frame(width: 180)
            }
        }
        .padding()
    }
}

struct PerspectiveView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.yellow, .orange]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .rotation3DEffect(
                        .degrees(-Double(self.dragAmount.width) / 10),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .rotation3DEffect(
                        .degrees(Double(self.dragAmount.height) / 10),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .offset(self.dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.dragAmount = .zero
                            }
                    }
                )
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
