//
//  View.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 9/2/2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func customBackground(color: Color = .background) -> some View {
        self.background(RoundedRectangle(cornerRadius: 8).fill(color))
    }
}
