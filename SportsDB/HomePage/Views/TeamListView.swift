//
//  TeamListView.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 9/2/2023.
//

import SwiftUI

struct TeamListView: View {

    var teams: [Team]

    var body: some View {
        ForEach(teams, id: \.idTeam) { team in
            NavigationLink(destination: DetailsView(viewModel: DetailViewModel(apiService: APIService()), team: team.strTeam ?? "")) {
                TeamCardView(logoUrl: team.strTeamBadge ?? "")
            }
        }
    }
}

#if DEBUG
struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListView(teams: [])
    }
}
#endif


