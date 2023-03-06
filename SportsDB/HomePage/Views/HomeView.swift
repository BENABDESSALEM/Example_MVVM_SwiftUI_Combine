//
//  HomeView.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 6/2/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var layoutStyle: GridLayoutStyle = .vertical
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                TeamView(viewModel: viewModel, style: layoutStyle)
                    .navigationTitle("Leagues list")
                    .navigationBarTitleDisplayMode(.automatic)
                    .padding(.top)
                if viewModel.state  == .loading {
                    ProgressView()
                }
            }
        }.searchable(text: $viewModel.searchText,placement: .navigationBarDrawer(displayMode: .always), prompt: "Search league"){
            ForEach(viewModel.filtredleagues, id: \.idLeague) { league in
                Text(league.strLeague ?? "")
                    .searchCompletion(league.strLeague ?? "")
            }
        }
        .onAppear { viewModel.fetchLeagues() }
        .onSubmit(of: .search) {
            viewModel.fetchTeams(team: viewModel.searchText)
            hideKeyboard()
        }.navigationViewStyle(StackNavigationViewStyle())
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
