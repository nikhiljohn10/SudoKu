//
//  Model.swift
//  SudoKu
//
//  Created by Nikhil John on 14/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

class UserModel: ObservableObject {
    @Published var setOptions = false
    @Published var optionsColor = Color.pink
    @Published var optionsTextColor = false
    @Published var lock = false
    @Published var isLocked = Array(
        repeating: Array(
            repeating: Array(
                repeating:  Array(
                    repeating: false,
                    count: 3
                ),count: 3
            ),count: 3
        ),count: 3
    )
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
}
