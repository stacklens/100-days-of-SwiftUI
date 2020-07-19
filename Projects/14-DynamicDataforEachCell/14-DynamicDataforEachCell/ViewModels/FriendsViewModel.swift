//
//  FriendsViewModel.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import Foundation

class FriendsViewModel: ObservableObject {
    @Published var model = FriendsModel()
    
    // MARK: - Access to the Model
    var friends: [Friend] {
        model.friends
    }
    
    var recentFriends: [Friend] {
        model.recentFriends
    }
    
    var otherFriends: [Friend] {
        model.otherFriends
    }
    
    // MARK: - Intent(s)
    func change(_ value: String, keyPath: WritableKeyPath<Friend, String>, atIndex index: Int) {
        model.change(value, keyPath: keyPath, atIndex: index)
    }
    
    func remove(_ friend: Friend) {
        model.remove(friend)
    }
    
    func add(_ friend: Friend) {
        model.add(friend)
    }
}
