//
//  headify.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/16.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

// MARK: - ViewModifier change image shape to circle
extension View {
    var headify: some View {
        self.modifier(Headify())
    }
}

struct Headify: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.headline).foregroundColor(Color.blue)
    }
}

