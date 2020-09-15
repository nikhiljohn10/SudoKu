//
//  OptionControl.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct OptionControl: View {
    @EnvironmentObject var model: UserModel
    var numbers = ["1","2","3","4","5","6","7","8","9"]
    var body: some View {
        VStack(spacing: 10){
            Text("Option")
            ClearButton()
            ForEach(0..<numbers.count) { id in
                OptButton(
                    text: self.numbers[id],
                    isActive: Binding<Bool>(
                        get: { () -> Bool in
                            return self.model.selectedOptions[self.numbers[id]] ?? false
                        }, set: { (val) in
                            var temp = self.model.selectedOptions
                            temp[self.numbers[id]] = val
                            self.model.selectedOptions = temp
                        }
                    )
                )
            }
        }
    }
}

struct OptButton: View {
    var text: String
    @Binding var isActive: Bool
    @EnvironmentObject var model: UserModel
    var body: some View {
        Button(action: {
            self.isActive.toggle()
            self.model.selectedOptions[self.text] = self.isActive
        }){
            Text(text)
                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                .font(.system(size: 24))
                .frame(width: 40, height: 40)
                .background(isActive ? Color.white : Color.black)
                .foregroundColor(isActive ? Color.black : Color.white)
                .cornerRadius(4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct ClearButton: View {
    @EnvironmentObject var model: UserModel
    var body: some View {
        Button(action: {
            self.model.selectedOptions = [String: Bool]()
        }){
            Text("C")
                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                .font(.system(size: 24))
                .frame(width: 40, height: 40)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
