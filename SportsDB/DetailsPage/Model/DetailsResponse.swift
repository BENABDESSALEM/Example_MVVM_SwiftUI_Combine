//
//  DetailsResponse.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 8/2/2023.
//

import Foundation

struct DetailsResponse : Codable {
    let teams : [Detail]?
    enum CodingKeys: String, CodingKey {
        case teams = "teams"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teams = try values.decodeIfPresent([Detail].self, forKey: .teams)
    }
}

struct Detail : Codable {
    let idTeam,strTeam : String?
    let strLeague : String?
    let strDescriptionEN : String?
    let strCountry : String?
    let strTeamBanner : String?

    enum CodingKeys: String, CodingKey {
        case idTeam = "idTeam"
        case strTeam = "strTeam"
        case strTeamBanner = "strTeamBanner"
        case strCountry = "strCountry"
        case strLeague = "strLeague"
        case strDescriptionEN = "strDescriptionEN"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
        strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
        strTeam = try values.decodeIfPresent(String.self, forKey: .strTeam)
        strDescriptionEN = try values.decodeIfPresent(String.self, forKey: .strDescriptionEN)
        strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
        strTeamBanner = try values.decodeIfPresent(String.self, forKey: .strTeamBanner)
    }

}
