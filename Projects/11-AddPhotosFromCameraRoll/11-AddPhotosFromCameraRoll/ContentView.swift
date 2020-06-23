//
//  ContentView.swift
//  11-AddPhotosFromCameraRoll
//
//  Created by 杜赛 on 2020/6/23.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var images = [CameraImage]()
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(images) { image in
                    CircleImage(uiImage: image.image)
                }
                Spacer()
            }
            .navigationBarTitle("Choose Images", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showingImagePicker = true
            })
            {
                Image(uiImage: UIImage(systemName: "camera.fill")!)
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: {
                if self.inputImage != nil {
                    self.images.append(CameraImage(image: self.inputImage!))
                    self.inputImage = nil
                }
            }) { ImagePicker(image: self.$inputImage) }
            )
        }
    }
}

struct CameraImage: Identifiable {
    var id = UUID()
    let image: UIImage
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
