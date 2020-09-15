//
//  Controls.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct Controls: View {
    var body: some View {
        VStack {
            Text("Controls")
                .font(.largeTitle)
                .padding(.vertical)
            HStack(alignment: .top, spacing: 40) {
                ValueControl()
                OptionControl()
            }
            Spacer()
        }
    }
}
