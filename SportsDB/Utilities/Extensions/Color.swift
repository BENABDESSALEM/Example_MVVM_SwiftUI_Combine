//
//  Color.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 9/2/2023.
//

import SwiftUI

extension Color {
    static var main: Color {
        Color(.systemPurple)
    }

    static var background: Color {
        Color(UIColor { (traits) -> UIColor in
            if traits.userInterfaceStyle == .dark {
                return UIColor.init(red: 50/255, green: 50/255, blue: 54/255, alpha: 1.0)
            } else {
                return UIColor.init(red: 239/255, green: 239/255, blue: 240/255, alpha: 1.0)
            }
        })
    }
}
