//
//  Board.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct Board: View {
    @EnvironmentObject var model: UserModel
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                ForEach(0..<3) { mbox_id in
                    HStack(spacing: 0) {
                        ForEach(0..<3) { box_id in
                            MajorBox(
                                isActiveSec: self.isActiveSec(row: mbox_id,col: box_id),
                                sec_id: self.sec_id(row: mbox_id, col: box_id)
                            )
                        }
                    }
                }
            }
        }
        .padding(2)
        .background(Color.black)
    }
    
    func isActiveSec(row: Int, col: Int) -> Bool {
        return self.model.selSec == (row * 3 + col)
    }
    
    func sec_id(row:Int, col:Int) -> Int {
        return ((row*3)+col)
    }
}
