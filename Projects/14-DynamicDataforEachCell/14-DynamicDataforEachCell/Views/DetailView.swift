//
//  DetailView.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: FriendsViewModel
    
    @State private var editMode: EditMode = .inactive
    
    
    let id: UUID
    
    private var friend: Friend? {
        viewModel.friends.first { $0.id == self.id }
    }
    
    private var friendIndex: Int? {
        viewModel.friends.firstIndex { $0.id == self.id }
    }
    
    var body: some View {
        VStack {
            Group {
                if self.friend != nil {
                    VStack {
                        Image(self.friend!.avatar ?? "avatar02")
                            .resizable()
                            .circllify
                            .frame(width: 120, height: 120)
                        
                        VStack(alignment: .leading) {
                            TitleText("name")
                            EditableText(
                                self.friend!.name ?? "none",
                                isEditing: self.editMode.isEditing
                                )
                            { name in
                                self.change(name, keyPath: \.name!)
                            }
                                .font(.headline)
                            
                            TitleText("mobile")
                            EditableText(
                                self.friend!.mobile ?? "none",
                                isEditing: self.editMode.isEditing
                                )
                            { name in
                                self.change(name, keyPath: \.mobile!)
                            }
                            
                            TitleText("email")
                            EditableText(
                                self.friend!.email ?? "none",
                                isEditing: self.editMode.isEditing
                                )
                            { name in
                                self.change(name, keyPath: \.email!)
                            }
                            
                            TitleText("notes")
                            EditableText(
                                self.friend!.notes ?? "none",
                                isEditing: self.editMode.isEditing
                                )
                            { name in
                                self.change(name, keyPath: \.notes!)
                            }
                        }
                        
                        Spacer()
                    }.padding()
                }
            }
            EditButton().font(.headline)
        }.environment(\.editMode, $editMode)
    }
    
    
    private func change(
        _ value: String,
        keyPath: WritableKeyPath<Friend, String>
    ) {
        if let index = self.friendIndex {
            self.viewModel.change(value, keyPath: keyPath, atIndex: index)
        }
    }
}





struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FriendsViewModel()
        return DetailView(id: viewModel.friends.first!.id).environmentObject(viewModel)
    }
}
