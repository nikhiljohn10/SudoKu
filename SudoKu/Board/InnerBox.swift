//
//  InnerBox.swift
//  SudoKu
//
//  Created by Nikhil John on 13/09/20.
//  Copyright © 2020 Nikz.in. All rights reserved.
//

import SwiftUI

struct InnerBox: View {
    var value: String
    var options: [String: Bool]
    @EnvironmentObject var model: UserModel
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                ForEach(0..<9){ id in
                    Text(self.getOption(id: id, options: self.options))
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .foregroundColor(Color(white: 0.3))
                }
            }
            .padding(.horizontal,2)
            Spacer()
            Text(self.value)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .foregroundColor(Color.black)
            Spacer()
        }
    }
    
    func getOption(id: Int, options: [String: Bool]) -> String {
        let text = String(id+1)
        return options[text] ?? false ? text : ""
    }
}
