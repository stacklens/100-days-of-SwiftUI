//
//  Person.swift
//  16-CoreData
//
//  Created by 杜赛 on 2020/7/22.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import Foundation
import CoreData



struct PersonData {
    let id: UUID
    var name: String
    var emoji: String
    
    private let names = ["James", "Bob", "Mike", "Picker", "Iva", "Alex", "Candy", "Eva", "Zack", "Will", "Ken"]
    private let emojis = "🐱🐭🐹🐼🦊🐰🐨🐯🦁🐸🐷🐵".map { String($0) }
    
    init() {
        self.id = UUID()
        self.name = names[names.count.arc4random]
        self.emoji = emojis[emojis.count.arc4random]
    }
}

extension Person: Identifiable {
    var name: String {
        get { name_ ?? "None" }
        set { name_ = newValue }
    }
    
    var emoji: String {
        get { emoji_ ?? "None" }
        set { emoji_ = newValue }
    }
}

extension Person {
    @discardableResult
    static func create(_ data: PersonData, in context: NSManagedObjectContext) -> Person {
        let person = Person(context: context)
        person.id = data.id
        person.emoji = data.emoji
        person.name = data.name
        
        try? context.save()
        
        return person
    }
    
    static func deleteAll(in context: NSManagedObjectContext) {
        let request = NSFetchRequest<Person>(entityName: "Person")
        let results = (try? context.fetch(request)) ?? []
        results.forEach { person in
            context.delete(person)
        }
        try? context.save()
    }
    
    static func customRequest(ascending: Bool = true) -> NSFetchRequest<Person> {
        let request = NSFetchRequest<Person>(entityName: "Person")
        request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: ascending)]

        return request
    }
    
    func update() {
        if let context = managedObjectContext {
            let data = PersonData()
            self.emoji = data.emoji
            self.name = data.name
            
            try? context.save()
        }
    }
}


extension Int {
    /// 0 ~ self 的随机数，上开下闭区间
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
