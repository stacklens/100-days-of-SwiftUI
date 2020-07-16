//
//  TitleText.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/16.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct TitleText: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(self.text).headify
    }
}
