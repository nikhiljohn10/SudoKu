//
//  ContentView.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 0) {
            Board().frame(width:690)
            Controls().frame(width:200)
        }
        .frame(width: 890, height: 690)
    }
}
