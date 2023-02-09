//
//  HomeViewModel.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 7/2/2023.
//

import Foundation
import Combine

enum LoadingState {
    case loading
    case finished
}

class HomeViewModel:ObservableObject {
    
     @Published private(set) var state = LoadingState.finished
     @Published var leagues: [League] = []
     @Published var filtredleagues: [League] = []
     @Published var teams: [Team] = []
     @Published var searchText: String = "" {
        didSet {
            if !searchText.isEmpty && searchText.count >= 3  {
                filtredleagues = leagues.filter { $0
                    .strLeague?
                    .localizedCaseInsensitiveContains(searchText) ?? false
                }
            } else {
                filtredleagues = []
            }
        }
     }
     private let apiService: APIService
     var cancellables = Set<AnyCancellable>()

     init(apiService: APIService) {
         self.apiService = apiService
     }

    func fetchLeagues() {
        self.state = .loading
        apiService.fetchLeagues()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.state = .finished
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.onFail(error)
                }
            }, receiveValue: { [weak self] apiResponse in
                self?.onSuccess(apiResponse)
            })
            .store(in: &cancellables)
    }
    
    func fetchTeams(team:String) {
        self.state = .loading
        apiService.fetchTeams(team: team)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.state = .finished
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.onFail(error)
                }
            }, receiveValue: { [weak self] apiResponse in
                self?.onSuccess(apiResponse)
            })
            .store(in: &cancellables)
    }
}

extension HomeViewModel {
    
    private func onSuccess(_ response: LeaguesResponse?) {
        guard let resp = response,let _leagues = resp.leagues else {
            self.leagues = []
            return
        }
        self.leagues = _leagues
    }
    
    private func onSuccess(_ response: TeamsResponse?) {
        guard let response = response,let teams = response.teams else {
            self.teams = []
            return
        }
        var lst:[Team] = teams
        lst = lst.sorted(by: { (team1, taam2) -> Bool in
            let teamName1 = team1.strTeam ?? ""
            let teamName2 = taam2.strTeam ?? ""
            return (teamName1.localizedCaseInsensitiveCompare(teamName2) == .orderedDescending)
        })
        self.teams = lst
    }
    
    private func onFail(_ error: Error?) {
        guard let error = error else { return }
        print(error.localizedDescription)
    }
}

