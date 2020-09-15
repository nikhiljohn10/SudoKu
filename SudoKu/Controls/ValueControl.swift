//
//  ValueControl.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct ValueControl: View {
    var numbers = ["1","2","3","4","5","6","7","8","9"]
    var body: some View {
        VStack(spacing: 10){
            Text("Value")
            RadButton(text: "")
            ForEach(0..<numbers.count) { id in
                RadButton(text: self.numbers[id])
            }
        }
    }
}

struct RadButton: View {
    @EnvironmentObject var model: UserModel
    var text: String
    var isOn: Bool {
        return self.model.selection == text
    }
    var body: some View {
        Button(action: {
            self.model.selection = self.text
        }){
            Text(self.text == "" ? "E" : self.text)
                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                .font(.system(size: 24))
                .frame(width: 40, height: 40)
                .background(isOn ? Color.white : Color.black)
                .foregroundColor(isOn ? Color.black : Color.white)
                .cornerRadius(4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
