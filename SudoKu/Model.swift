//
//  Model.swift
//  SudoKu
//
//  Created by Nikhil John on 14/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

class UserModel: ObservableObject {
    @Published var value = Array(
        repeating: Array(
            repeating: Array(
                repeating:  Array(
                    repeating: "",
                    count: 3
                ),count: 3
            ),count: 3
        ),count: 3
    )
    @Published var options = Array(
        repeating: Array(
            repeating: Array(
                repeating:  Array(
                    repeating: [String: Bool](),
                    count: 3
                ),count: 3
            ),count: 3
        ),count: 3
    )
    @Published var selSec = 0
    @Published var selRow = 0
    @Published var selCol = 0
    
    var selection: String {
        get {
            let sec = self.selSec
            let sec_col = sec%3
            let sec_row = (sec-sec_col)/3
            return self.value[sec_row][sec_col][self.selRow][self.selCol]
        }
        set {
            let sec = self.selSec
            let sec_col = sec%3
            let sec_row = (sec-sec_col)/3
            self.value[sec_row][sec_col][self.selRow][self.selCol] = newValue
        }
    }
    
    var selectedOptions: [String: Bool] {
        get {
            let sec = self.selSec
            let sec_col = sec%3
            let sec_row = (sec-sec_col)/3
             return self.options[sec_row][sec_col][self.selRow][self.selCol]
         }
         set {
             let sec = self.selSec
             let sec_col = sec%3
             let sec_row = (sec-sec_col)/3
             self.options[sec_row][sec_col][self.selRow][self.selCol] = newValue
         }
    }
    
    func testSec(row: Int, col: Int) -> Bool {
        let sum = (row * 3 + col)
        return self.selSec == sum
    }
    
    func testBox(row: Int, col: Int) -> Bool {
        return self.selRow == row && self.selCol == col
    }
    
    func mapBoard(sec: Int, row: Int, col: Int) -> Int {
        return ((sec*9)+(row*3)+(col))
    }
}
