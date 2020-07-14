//
//  FriendsViewModel.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import Foundation

class FriendsViewModel: ObservableObject {
    @Published var friends = Friends.allFriends(in: "dict") ?? []
}
