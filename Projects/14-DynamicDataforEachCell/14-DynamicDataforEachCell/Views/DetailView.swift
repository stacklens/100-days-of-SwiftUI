//
//  DetailView.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model: FriendsViewModel
    @State private var name = "none"
    
    let id: UUID
    
    private var friend: Friend? {
        model.friends.first { $0.id == self.id }
    }
    
    var body: some View {
        Group {
            if self.friend != nil {
                VStack {
                    Image(self.friend!.avatar ?? "avatar02")
                        .resizable()
                        .circllify
                        .frame(width: 120, height: 120)
                    Text("name").font(.title)
                    Text(self.friend!.name ?? "none")
                    TextField("name", text: $name)
                    Spacer()
                }.padding()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FriendsViewModel()
        return DetailView(id: viewModel.friends.first!.id).environmentObject(viewModel)
    }
}
