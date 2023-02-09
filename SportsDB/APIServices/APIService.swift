//
//  APIService.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 7/2/2023.
//

import Foundation
import Combine

class APIService {
    func fetchLeagues() -> AnyPublisher<LeaguesResponse, Error> {
        let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LeaguesResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchTeams(team:String) -> AnyPublisher<TeamsResponse, Error> {
        let baseURL = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/search_all_teams.php")!
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "l", value: team)
        ]
        let searchURL = components.url!
        return URLSession.shared.dataTaskPublisher(for: searchURL)
            .map { $0.data }
            .decode(type: TeamsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchTeamDetails(team:String) -> AnyPublisher<DetailsResponse, Error> {
        let baseURL = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/searchteams.php")!
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "t", value: team)
        ]
        let searchURL = components.url!
        return URLSession.shared.dataTaskPublisher(for: searchURL)
            .map { $0.data }
            .decode(type: DetailsResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
