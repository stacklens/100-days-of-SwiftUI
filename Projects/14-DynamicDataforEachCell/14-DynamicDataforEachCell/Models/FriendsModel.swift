//
//  FriendsModel.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/16.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import Foundation

struct FriendsModel {
    private(set) var friends = Friends.allFriends(in: "dict") ?? []
    
    var recentFriends: [Friend] {
        return Array(friends[0..<((friends.endIndex > 3) ? 3 : friends.endIndex)])
    }
    
    var otherFriends: [Friend] {
        if friends.endIndex > 3 {
            return Array(friends[3..<friends.endIndex])
        } else {
            return []
        }
    }
    
    mutating func change(_ value: String, keyPath: WritableKeyPath<Friend, String>, atIndex index: Int) {
        friends[index][keyPath: keyPath] = value
    }
    
    mutating func remove(_ friend: Friend) {
        friends.removeAll(where: { $0 == friend })
    }
}
