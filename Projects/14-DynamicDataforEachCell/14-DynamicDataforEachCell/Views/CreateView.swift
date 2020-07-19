//
//  CreateView.swift
//  14-DynamicDataforEachCell
//
//  Created by 杜赛 on 2020/7/17.
//  Copyright © 2020 Du Sai. All rights reserved.
//

import SwiftUI

struct CreateView: View {
    @EnvironmentObject var viewModel: FriendsViewModel
    
    @Binding var showingCreate: Bool


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
                        DoneButton.padding()
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
    }
    
    var DoneButton: some View {
        Button("Done") {
            self.viewModel.add(
                Friend(
                    name: self.name,
                    avatar: "avatar\(String(format: "%02d", 12.arc4random + 1))",
                    mobile: self.mobile,
                    email: self.email,
                    notes: self.notes
                )
            )
            self.showingCreate.toggle()
        }
    }
    
    var cancel: some View {
        Button("Cancel") {
            
        }
    }
}

extension Int {
    /// 0 ~ self 的随机数，上开下闭区间
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(showingCreate: Binding.constant(true))
    }
}
