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
    var isActiveSec: Bool
    var sec_id: Int
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<3) { row_id in
                HStack(spacing: 0) {
                    ForEach(0..<3) { col_id in
                        Box(
                            isActiveSec: self.isActiveSec,
                            sec: self.sec_id,
                            row: row_id,
                            col: col_id
                        ).onTapGesture {
                            self.model.selSec = self.sec_id
                            self.model.selRow = row_id
                            self.model.selCol = col_id
                        }
                    }
                }
            }
        }
    .padding(1)
    }
}
