//
//  Circllify.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/14.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

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
