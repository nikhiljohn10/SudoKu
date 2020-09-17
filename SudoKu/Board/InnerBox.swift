//
//  InnerBox.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct InnerBox: View {
    @Binding var value: String
    @Binding var options: [String: Bool]
    @EnvironmentObject var model: UserModel
    var body: some View {
        VStack(spacing: 0){
            if self.value == "" {
                BoardOf3x3 { (rid, cid) in
                    InnerButton(
                        row: rid, col: cid,
                        isActive: self.getOption(rid: rid, cid: cid),
                        action:{
                            if self.model.setOptions {
                                self.options["\(rid*3+cid+1)"] = !self.getOption(rid: rid, cid: cid)
                            } else {
                                self.value = String(rid*3+cid+1)
                            }
                        }
                    )
                }.padding(.horizontal,2)
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


struct InnerButton: View {
    var row: Int
    var col: Int
    var isActive: Bool
    var action: () -> ()
    var body: some View {
        Button(action: action) {
            InnerText(
                text: "\(row*3+col+1)",
                isActive: self.isActive
            )
        }.buttonStyle(PlainButtonStyle())
    }
}


struct InnerText: View {
    var text: String
    var isActive: Bool
    @EnvironmentObject var model: UserModel
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.system(size: 12))
            .frame(width:21,height: 21)
            .foregroundColor(Color(white: self.isActive ? (self.model.optionsTextColor ? 0 : 1) : 0.4 ))
            .background(self.isActive ? self.model.optionsColor : Color.white )
            .cornerRadius(2)
            .padding(1)
    }
}
