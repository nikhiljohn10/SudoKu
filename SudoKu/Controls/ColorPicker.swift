//
//  ColorPicker.swift
//  SudoKu
//
//  Created by Nikhil John on 17/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct ColorPicker: View {
    var body: some View {
        VStack{
            HStack {
                ColorSwatch(color: Color(NSColor.cyan))
                ColorSwatch(color: Color.green)
                ColorSwatch(color: Color.blue)
            }
            HStack {
                ColorSwatch(color: Color.yellow)
                ColorSwatch(color: Color.pink)
                ColorSwatch(color: Color.purple)
            }
            HStack {
                ColorSwatch(color: Color.orange)
                ColorSwatch(color: Color.red)
                ColorSwatch(color: Color(NSColor.magenta))
            }
        }
    }
}


struct ColorSwatch<ShapeColor: ShapeStyle>: View {
    var color: ShapeColor
    @EnvironmentObject var model: UserModel
    init(color: ShapeColor) {
        self.color = color
    }
    var body: some View {
        Button(action: {
            self.model.optionsColor = self.color as! Color
        }) {
            RoundedRectangle(cornerRadius: 4)
                .fill(self.color)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 40, height: 40)
    }
}
