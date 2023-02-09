//
//  AutoCompleteRow.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 8/2/2023.
//

import Foundation
import SwiftUI

struct AutoCompleteRow: View {
    
    typealias Action = (String) -> Void
    let title:String
    @Binding var selectedItem: String?
    var action:Action?
    
    var body: some View {
        Text(title)
            .onTapGesture {
                selectedItem = title == selectedItem ? nil : title
                if let action = action {
                    action(title)
                }
            }
    }
}

#if DEBUG
struct AutoCompleteRow_Previews: PreviewProvider {
    static var previews: some View {
        AutoCompleteRow(title: "French Ligue 1", selectedItem: .constant("NoName"))
    }
}
#endif
