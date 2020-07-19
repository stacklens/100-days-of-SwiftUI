//
//  ContentView.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: FriendsViewModel
    
    @State private var editMode: EditMode = .inactive
    
    @State private var showingCreate = false

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Recent")) {
                    ForEach(self.viewModel.recentFriends) { friend in
                        NavigationLink(destination: DetailView(id: friend.id)) {
                            HStack {
                                Image(friend.avatar ?? "avatar02").circllify
                                Text(friend.name ?? "none")
                            }
                        }
                    }
                        .onDelete { indexSet in
                            indexSet.map{ self.viewModel.recentFriends[$0] }.forEach { friend in
                                self.viewModel.remove(friend)
                            }
                        }
                }
                
                Section(header: Text("Friends")) {
                    ForEach(self.viewModel.otherFriends) { friend in
                        NavigationLink(destination: DetailView(id: friend.id)) {
                            HStack {
                                Image(friend.avatar ?? "avatar02").circllify
                                Text(friend.name ?? "none")
                            }
                        }
                    }
                        .onDelete { indexSet in
                            indexSet.map{ self.viewModel.otherFriends[$0] }.forEach { friend in
                                self.viewModel.remove(friend)
                            }
                        }
                }

            }
                .navigationBarTitle("Friends")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(action: {
                        self.showingCreate.toggle()
                    })
                    {
                        
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showingCreate) {
                        CreateView(showingCreate: self.$showingCreate).environmentObject(self.viewModel)
                    }
                )
                .environment(\.editMode, $editMode)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(FriendsViewModel())
    }
}
