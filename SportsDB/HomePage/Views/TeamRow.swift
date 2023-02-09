//
//  TeamRow.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 8/2/2023.
//

import SwiftUI

struct TeamRow: View {
    let urlString: String
    var body: some View {
        AsyncImage(
            url: URL(string: urlString),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 50, maxWidth: 130,minHeight:50,maxHeight: 130)
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

#if DEBUG
struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamRow(urlString: "https://www.thesportsdb.com/images/media/team/logo/vyvsvu1421945702.png")
    }
}
#endif


