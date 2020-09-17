//
//  ContentView.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct ContentView: View{
    @State var askData = true
    var body: some View {
        HStack(spacing: 0) {
            Board()
            Controls()
        }
    }
}
