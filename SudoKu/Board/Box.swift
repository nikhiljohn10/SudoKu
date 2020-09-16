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
    var isActiveSec: Bool
    var sec: Int
    var row: Int
    var col: Int
    var sec_col: Int {
        return self.sec%3
    }
    var sec_row: Int {
        return (self.sec - self.sec_col)/3
    }
    var isActive: Bool {
        return self.isActiveSec && self.model.testBox(row: self.row, col: self.col)
    }
    var body: some View {
        InnerBox(
            value: self.model.value[sec_row][sec_col][row][col],
            options: Binding<[String: Bool]>(
                get: { () -> [String: Bool] in
                    return self.model.options[self.sec_row][self.sec_col][self.row][self.col]
                }, set: { (options) in
                    self.model.selSec = self.sec
                    self.model.selRow = self.row
                    self.model.selCol = self.col
                    self.model.options[self.sec_row][self.sec_col][self.row][self.col] = options
                }
            )
        )
        .frame(width: 72, height: 72)
//        .background(self.isActive ? Color(red: 0.7, green: 0.9, blue: 1.0) : Color.white)
            .background(self.isActive ? Color(red: 1.0, green: 0.7, blue: 0.9) : Color.white)
        .padding(1)
    }
}
