//
//  CircleImage.swift
//  11-AddPhotosFromCameraRoll
//
//  Created by 杜赛 on 2020/6/23.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var uiImage: UIImage
    
    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 10)
            .frame(width: 150, height: 150)
            .padding()
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(uiImage: UIImage(named: "rainbowlake")!)
    }
}
