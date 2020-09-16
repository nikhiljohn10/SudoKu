//
//  InnerBox.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct InnerBox: View {
    var value: String
    @Binding var options: [String: Bool]
    @EnvironmentObject var model: UserModel
    var body: some View {
        VStack(spacing: 0){
            if self.value == "" {
                VStack(spacing: 0){
                    ForEach(0..<3){ rid in
                        HStack(spacing: 0){
                            ForEach(0..<3){ cid in
                                Button(action:{
                                    self.options["\(rid*3+cid+1)"] = !self.getOption(rid: rid, cid: cid)
                                }){
                                    InnerOptText(
                                        text: "\(rid*3+cid+1)",
                                        isActive: self.getOption(rid: rid, cid: cid)
                                    )
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            .padding(.horizontal,2)
            } else {
                Text(self.value)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
            }
        }
    }
    
    func getOption(rid: Int, cid: Int) -> Bool {
        return self.options["\(rid*3+cid+1)"] ?? false
    }
}


struct InnerOptText: View {
    var text: String
    var isActive: Bool
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.system(size: 12))
            .frame(width:21,height: 21)
            .foregroundColor(Color(white: self.isActive ? 1 : 0.4 ))
            .background(self.isActive ? Color.pink : Color.white )
            .cornerRadius(2)
            .padding(1)
    }
}
