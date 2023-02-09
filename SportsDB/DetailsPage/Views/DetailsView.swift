//
//  DetailsView.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 8/2/2023.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: DetailViewModel
    var team: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                AsyncImage(
                    url: URL(string: viewModel.detail?.strTeamBanner ?? ""),
                    content: { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
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
