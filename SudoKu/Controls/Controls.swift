//
//  Controls.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct Controls: View {
    @EnvironmentObject var model: UserModel
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            VStack(alignment: .center) {
                Text("SudoKu Helper v2.1")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
            }
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
            .opacity(0.2)
            .frame(maxWidth: .infinity)
            VStack(alignment: .leading) {
                Text("Controls")
                    .font(.headline)
                Toggle(isOn: self.$model.setOptions){
                    Text("Option Mode: ")
                }.toggleStyle(SwitchToggleStyle())
                Toggle(isOn: self.$model.lock){
                    Text("Lock: ")
                }.toggleStyle(SwitchToggleStyle())
            }
            VStack(alignment: .leading) {
                Text("Option Color")
                    .font(.headline)
                ColorPicker()
                Toggle(isOn: self.$model.optionsTextColor){
                    Text("Black text: ")
                }.toggleStyle(SwitchToggleStyle())
            }
            Spacer()
            VStack(alignment: .center) {
                Button(action: {
                    DispatchQueue.main.async {
                        NSApplication.shared.keyWindow?.close()
                    }
                }){
                    Text("Exit")
                        .font(.system(size: 16))
                        .padding(.vertical,10)
                        .padding(.horizontal,40)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(4)
                    
                }
                .buttonStyle(PlainButtonStyle())
            }
            .frame(maxWidth: .infinity)
        }
        .padding([.horizontal,.bottom],20)
    }
}
