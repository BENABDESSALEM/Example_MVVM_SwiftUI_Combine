//
//  TeamCardView.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 8/2/2023.
//

import SwiftUI
import Kingfisher

struct TeamCardView: View {
    var logoUrl: String

    var body: some View {
        VStack(spacing: 8) {
            KFImage(URL(string: logoUrl))
                .placeholder {
                    // Placeholder while downloading.
                    Image(systemName: "arrow.2.circlepath.circle")
                        .font(.largeTitle)
                        .opacity(0.3)
                }.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 50, maxWidth: 130,minHeight:50,maxHeight: 130)
        }
        .accessibilityElement(children: .combine)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(8)
        .customBackground(color: .background)
    }
}

#if DEBUG
struct TeamRow_Previews: PreviewProvider {
    static var previews: some View {
        TeamCardView(logoUrl: "https://www.thesportsdb.com/images/media/team/logo/vyvsvu1421945702.png")
    }
}
#endif


