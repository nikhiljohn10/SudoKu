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
        VStack(alignment: .leading){
            ForEach(Array(stride(from: 1, to: 100, by: 10)), id: \.self) { index in
                HStack{
                    ColorSwatch(H: index, S: 40, B: 100)
                    ColorSwatch(H: index, S: 60, B: 100)
                    ColorSwatch(H: index, S: 80, B: 100)
                    ColorSwatch(H: index, S: 100, B: 100)
                    ColorSwatch(H: index, S: 100, B: 80)
                    ColorSwatch(H: index, S: 100, B: 60)
                    ColorSwatch(H: index, S: 100, B: 40)
                    ColorSwatch(H: index, S: 100, B: 30)
                    ColorSwatch(H: index, S: 100, B: 20)
                }
            }
//            Group {
//                ColorSwatch("Aqua Menthe", R: 127, G: 255, B: 212)
//                ColorSwatch("Proton Purple", R: 138, G: 43, B: 226)
//                ColorSwatch("Orange Red", R: 255, G: 69, B: 0)
//                ColorSwatch("Office Green", R: 0, G: 128, B: 0)
//                ColorSwatch("Just Blue", R: 0, G: 0, B: 255)
//                ColorSwatch("Blush Pink", R: 255, G: 192, B: 203)
//                ColorSwatch("Chartreuse Yellow", R: 233, G: 255, B: 0)
//                ColorSwatch("Cosmic Latte", R: 255, G: 249, B: 227)
//            }
//            HStack {
//                ColorSwatch(color: Color(NSColor.cyan))
//                ColorSwatch(color: Color.green)
//                ColorSwatch(color: Color.blue)
//                ColorSwatch(color: Color.purple)
//            }
//            HStack {
//                ColorSwatch(color: Color.yellow)
//                ColorSwatch(color: Color.pink)
//                ColorSwatch(color: Color.purple)
//                ColorSwatch(color: Color.purple)
//            }
//            HStack {
//                ColorSwatch(color: Color.orange)
//                ColorSwatch(color: Color.red)
//                ColorSwatch(color: Color(NSColor.magenta))
//                ColorSwatch(color: Color.purple)
//            }
//            HStack {
//                ColorSwatch(color: Color.orange)
//                ColorSwatch(color: Color.red)
//                ColorSwatch(color: Color(NSColor.magenta))
//                ColorSwatch(color: Color.purple)
//            }
        }
    }

}


struct ColorSwatch: View {
    var color: Color
    @EnvironmentObject var model: UserModel
    init(H: Int, S: Int, B: Int) {
        let hue = Double(H)/100.0
        let saturation = Double(S)/100.0
        let brightness = Double(B)/100.0
        self.color = Color(hue: hue, saturation: saturation, brightness: brightness)
    }
    var body: some View {
        Button(action: {
            self.model.optionsColor = self.color
        }) {
            RoundedRectangle(cornerRadius: 4)
                .fill(self.color)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 20, height: 20)
        
    }
    
}
