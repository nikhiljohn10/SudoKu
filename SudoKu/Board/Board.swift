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
            BoardOf3x3 { sec_row_id, sec_col_id   in
                MajorBox(sec_id: (sec_row_id*3)+sec_col_id)
            }
        }
        .padding(2)
        .background(Color.black)
        .padding([.leading,.bottom], 20)
    }
}

struct BoardOf3x3<Content: View>: View {
    let content: (Int, Int) -> Content
    init( @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.content = content
    }
    var body: some View {
        VStack(spacing: 0){
            ForEach(0..<3){ rid in
                HStack(spacing: 0){
                    ForEach(0..<3){ cid in
                        self.content(rid, cid)
                    }
                }
            }
        }
    }
}
