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
        VStack(spacing: 30){
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
        }.padding(.vertical,10)
    }
}
