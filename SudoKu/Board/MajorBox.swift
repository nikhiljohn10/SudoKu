//
//  MajorBox.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct MajorBox: View {
    @EnvironmentObject var model: UserModel
    var sec_id: Int
    var sec_col: Int {
        return self.sec_id%3
    }
    var sec_row: Int {
        return (self.sec_id - self.sec_col)/3
    }
    var body: some View {
        BoardOf3x3 { row_id, col_id in
            Box(
                sec_row: self.sec_row,
                sec_col: self.sec_col,
                row: row_id,
                col: col_id
            ).onTapGesture {
                if !self.model.isLocked[self.sec_row][self.sec_col][row_id][col_id] && !self.model.setOptions {
                    self.model.value[self.sec_row][self.sec_col][row_id][col_id] = ""
                }
                if !self.model.lock {
                    self.model.isLocked[self.sec_row][self.sec_col][row_id][col_id] = false
                }
            }
            .animation(.interpolatingSpring(stiffness: 50, damping: 10))
        }.padding(1)
    }
}
