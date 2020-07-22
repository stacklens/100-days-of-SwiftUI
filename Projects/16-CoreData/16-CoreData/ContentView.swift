//
//  ContentView.swift
//  16-CoreData
//
//  Created by 杜赛 on 2020/7/22.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
//    @FetchRequest(entity: Person.entity(), sortDescriptors: [NSSortDescriptor(key: "name_", ascending: true)]) var persons: FetchedResults<Person>
    @FetchRequest var persons: FetchedResults<Person>

    @State private var isAscending = true
    
    init() {
        let request = Person.customRequest()
        _persons = FetchRequest(fetchRequest: request)
    }
            
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $isAscending) {
                    Text("Ascending")
                }.padding().font(.headline)
                                
                Detail(ascending: self.isAscending)
                .navigationBarTitle("Persons")
                .navigationBarItems(leading: delete, trailing: add)
            }

        }
    }
    
    var delete: some View {
        Button(action: {
            Person.deleteAll(in: self.context)
        }) {
            Image(systemName: "trash")
        }
    }
    
    var add: some View {
        Button(action: {
            Person.create(PersonData(), in: self.context)
        }) {
            Image(systemName: "plus")
        }
    }
}

struct Detail: View {
    @FetchRequest var persons: FetchedResults<Person>
    
    init(ascending: Bool) {
        let request = Person.customRequest(ascending: ascending)
        _persons = FetchRequest(fetchRequest: request)
    }

    var body: some View {
        List(persons) { person in
            HStack {
                Text(person.emoji).font(.system(size: 36))
                Text(person.name)
            }
            .onTapGesture {
                person.update()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
