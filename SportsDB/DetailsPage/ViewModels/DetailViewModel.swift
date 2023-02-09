//
//  DetailViewModel.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 8/2/2023.
//

import Foundation
import Combine

class DetailViewModel:ObservableObject {
    
    @Published var detail: Detail?
    @Published private(set) var state = LoadingState.finished
    private let apiService: APIService
    var cancellables = Set<AnyCancellable>()

    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchTeam(team:String) {
        self.state = .loading
        apiService.fetchTeamDetails(team: team)
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

extension DetailViewModel {
    
    private func onSuccess(_ response: DetailsResponse?) {
        guard let resp = response,let detail = resp.teams?.first else {
            return
        }
        self.detail = detail
    }
    
    private func onFail(_ error: Error?) {
        guard let error = error else { return }
        print(error.localizedDescription)
    }
}
