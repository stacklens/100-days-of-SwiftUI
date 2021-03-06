//
//  ContentView.swift
//  13-BasicList
//
//  Created by 杜赛 on 2020/7/12.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                movieRow
            }
                .navigationBarTitle("Movies")
        }
    }
    
    var movieRow: some View {
        ForEach(Array(movies.keys).sorted(by: <), id: \.self) { section in
            Section(header: Text(section)) {
                ForEach(Movie.moviesInSection(index: section)) { movie in
                    Text(movie.title)
                }
            }
        }
    }
}

struct Movie: Identifiable {
    var id = UUID()
    let title: String
    
    static func moviesInSection(index: String) -> [Movie] {
        var res = [Movie]()
        guard let titles = movies[index] else { return res }

        for title in titles {
            res.append(Movie(title: title))
        }
        return res
    }
}


let movies: [String: [String]] = [
    "A": ["Aladdin", "Aliens", "American History X", "Anchorman: The Legend of Ron Burgundy", "A World Without Thieves"],
    "B": ["Basic Instinct", "Batman Begins", "Beauty and The Beast", "The Beach", "Big Trouble in Little China"],
    "C": ["Catch Me If You Can", "Cloudy with a Chance of Meatballs", "The Crow"],
    "D": ["The Departed", "Dredd", "Dr. Strangelove", "Dumb & Dumber"],
    "E": ["Enter The Dragon", "Equilibrium", "Escape from New York", "Event Horizon"],
    "F": ["Fight Club", "Finding Nemo", "First Blood", "Full Metal Jacket"],
    "G": ["Gladiator", "The Godfather", "Good Will Hunting", "Goodfellas", "The Goonies"],
    "H": ["Harry Potter", "Hercules", "Hero", "Horton Hears A Who", "How to Train Your Dragon"],
    "I": ["Ice Age", "Inception", "The Incredibles", "Indiana Jones", "Iron Man"],
    "J": ["Jaws", "Jumanji", "Jurassic Park"],
    "K": ["Kill Bill", "King Kong", "Knocked Up", "Kung Fu Hustle"],
    "L": ["The Land Before Time", "The Lego Movie", "The Lord of the Rings", "Lost in Space"],
    "M": ["The Mask", "The Matrix", "Men in Black", "Minority Report", "Mission Impossible", "Monsters, Inc."],
    "N": ["Napoleon Dynamite", "National Treasure", "Night of the Museum"],
    "O": ["Office Space", "Old Boy", "Old School", "Over the Hedge"],
    "P": ["The Pacifier", "Pan's Labyrinth", "Pinocchio", "Pride & Prejudice", "Public Enemies"],
    "Q": ["Quarantine", "Quick Gun Murugun", "A Quiet Little Marriage"],
    "R": ["Ratatouille", "Red Eye", "Resident Evil", "Rocky", "Rush Hour"],
    "S": ["Schindler's List", "Se7en", "The Shawshank Redemption", "Sherlock Holmes", "Shrek", "Silent Hill", "Sin City"],
    "T": ["Terminator", "Texas Chainsaw Massacre", "Titanic", "Toy Story", "Transformers", "The Truman Show"],
    "U": ["Undercover Brother", "Underworld", "Up In the Air"],
    "V": ["V for Vendetta", "Vanilla Sky", "Venus Boyz"],
    "W": ["Wall-E", "Wanted", "The Wild", "Willy Wonka and the Chocolate Factory", "The Wizard of Oz"],
    "X": ["The X-Files: Fight the Future", "X-Men", "xXx"],
    "Y": ["You Got Served", "You've Got Mail", "You Only Live Twice", "Young Frankenstein"],
    "Z": ["Zombieland", "Zookeeper", "Zoolander", "Zorro"]
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
