//
//  Text.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 9/2/2023.
//

import SwiftUI

extension Text {
    func headline() -> some View {
        self
            .kerning(1)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal, .top])
            .accessibility(addTraits: .isHeader)
    }
}
