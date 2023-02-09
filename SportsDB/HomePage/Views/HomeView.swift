//
//  HomeView.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 6/2/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State private var selectionItem: String? = nil
    @State private var isSearching: Bool = false
    @State private var isSelected: Bool = false

    let layout: [GridItem] = [GridItem(.adaptive(minimum: 130))]
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVGrid(columns:layout,alignment: .center,spacing:20) {
                        ForEach(viewModel.teams,id: \.idTeam) { team in
                            NavigationLink(destination: DetailsView(viewModel: DetailViewModel(apiService: APIService()), team: team.strTeam!)) {
                                TeamRow(urlString: team.strTeamBadge ?? "")
                            }
                        }
                    }.padding(.horizontal)
                }.navigationTitle("Leagues list")
                 .navigationBarTitleDisplayMode(.automatic)
                 .padding(.top)
                if viewModel.state  == .loading {
                    ProgressView()
                }
            }
        }
        .searchable(text: $viewModel.searchText,placement: .navigationBarDrawer(displayMode: .always), prompt: "Search league"){
            ForEach(viewModel.filtredleagues, id: \.idLeague) { league in
                Text(league.strLeague ?? "")
                    .searchCompletion(league.strLeague ?? "")
            }
        }
        .onAppear { viewModel.fetchLeagues() }
        .onSubmit(of: .search) {
            viewModel.fetchTeams(team: viewModel.searchText)
            hideKeyboard()
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(apiService: APIService())).previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.portrait)
    }
}
#endif

