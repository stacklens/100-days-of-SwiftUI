//
//  CreateView.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/17.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct CreateView: View {
    private var newFriend = Friend()
    @State private var name = ""
    @State private var email = ""
    @State private var mobile = ""
    @State private var notes = ""
    
    var body: some View {

            
            VStack {
                ZStack(alignment: .top) {
                    Text("Palette Editor").font(.headline).padding()
                    HStack {
                        Spacer()
                        Button(action: {
                        }, label: { Text("Done") }).padding()
                    }
                }
                
                
                Form {
                    TitleText("name")
                    TextField("Enter your name", text: $name)
                    TitleText("mobile")
                    TextField("Enter your mobile", text: $mobile)
                    TitleText("email")
                    TextField("Enter your email", text: $email)
                    TitleText("notes")
                    TextField("Enter your notes", text: $notes)
                }


                
            }
//            .navigationBarTitle("Create")
//            .navigationBarItems(leading: cancel, trailing: done)
            
        

    }
    
    var done: some View {
        Button("Done") {
            
        }
    }
    
    var cancel: some View {
        Button("Cancel") {
            
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
