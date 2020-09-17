//
//  Box.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct Box: View {
    @EnvironmentObject var model: UserModel
    var sec_row: Int
    var sec_col: Int
    var row: Int
    var col: Int
    var body: some View {
        InnerBox(
            value: Binding<String>(
                get: { () -> String in
                    return self.model.value[self.sec_row][self.sec_col][self.row][self.col]
                }, set: { (text) in
                    self.model.value[self.sec_row][self.sec_col][self.row][self.col] = text
                    if !self.model.lock {
                        self.model.isLocked[self.sec_row][self.sec_col][self.row][self.col] = true
                    }
                }
            ),
            options: Binding<[String: Bool]>(
                get: { () -> [String: Bool] in
                    return self.model.options[self.sec_row][self.sec_col][self.row][self.col]
                }, set: { (options) in
                    self.model.options[self.sec_row][self.sec_col][self.row][self.col] = options
                }
            )
        )
        .frame(width: 72, height: 72)
        .background(self.model.isLocked[self.sec_row][self.sec_col][self.row][self.col] ? Color(white: 0.88) : Color.white)
        .padding(1)
    }
}
