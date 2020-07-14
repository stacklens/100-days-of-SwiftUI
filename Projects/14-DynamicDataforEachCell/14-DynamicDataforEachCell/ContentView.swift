//
//  ContentView.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct FriendsList: View {
    @EnvironmentObject var model: FriendsViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(self.model.friends) { friend in
                    NavigationLink(destination: DetailView(id: friend.id)) {
                        HStack {
                            Image(friend.avatar ?? "avatar02").circllify
                            Text(friend.name ?? "none")
                        }
                    }
                }
            }.navigationBarTitle("Friends")
        }
    }
}




// MARK: - ViewModifier change image shape to circle
extension View {
    var circllify: some View {
        self.modifier(Circllify())
    }
}

struct Circllify: ViewModifier {
    func body(content: Content) -> some View {
        content.clipShape(Circle())
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList().environmentObject(FriendsViewModel())
    }
}
