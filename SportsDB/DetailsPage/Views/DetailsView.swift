//
//  DetailsView.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 8/2/2023.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var team: String
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                KFImage(URL(string: viewModel.detail?.strTeamBanner ?? ""))
                    .placeholder {
                        // Placeholder while downloading.
                        Image("")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .customBackground(color: .background)
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                Text(viewModel.detail?.strCountry ?? "")
                Text(viewModel.detail?.strLeague ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                Text(viewModel.detail?.strDescriptionEN ?? "")
            }).onAppear { viewModel.fetchTeam(team: team) }
            .padding(.horizontal)
            .navigationTitle(viewModel.detail?.strTeam ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#if DEBUG
struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(viewModel: DetailViewModel(apiService: APIService()), team: "Real Madrid")
    }
}
#endif
