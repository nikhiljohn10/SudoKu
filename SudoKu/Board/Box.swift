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
    var body: some View {
        InnerBox(
            value: self.model.value[sec_row][sec_col][row][col],
            options: self.model.options[sec_row][sec_col][row][col]
        )
        .frame(width: 72, height: 72)
        .background(isBoxSelected() ? Color(red: 0.7, green: 0.9, blue: 1.0) : Color.white)
        .padding(1)
    }
    
    func isBoxSelected() -> Bool {
        return self.isActiveSec && self.model.testBox(row: self.row, col: self.col)
    }
}
