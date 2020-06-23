//
//  ContentView.swift
//  8-BasicList
//
//  Created by 杜赛 on 2020/6/23.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var heros = [
        Hero(name: "Super man"),
        Hero(name: "Spider man"),
        Hero(name: "Iron man"),
        Hero(name: "Bat man")
    ]
    
    var body: some View {
        
        
        return NavigationView {
            List {
                ForEach(heros) { hero in
                    HeroRow(hero: hero)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle("Hero List", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
    
    private func delete(at offsets: IndexSet){
        heros.remove(atOffsets: offsets)
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        heros.move(fromOffsets: source, toOffset: destination)
    }
}

struct HeroRow: View {
    var hero: Hero
    
    var body: some View {
        Text("\(hero.name)")
    }
}

struct Hero: Identifiable {
    var id = UUID()
    var name: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
