//
//  Friend.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id = UUID()
    
    var index: Int?
    
    var name: String?
    var avatar: String?
    var mobile: String?
    var email: String?
    var notes: String?
}
