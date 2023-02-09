//
//  TeamsResponse.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 7/2/2023.
//

import Foundation

struct TeamsResponse : Codable {
    let teams : [Team]?
    enum CodingKeys: String, CodingKey {
        case teams = "teams"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teams = try values.decodeIfPresent([Team].self, forKey: .teams)
    }
}

struct Team : Codable {
    let idTeam, strTeam, strTeamBadge : String?

    enum CodingKeys: String, CodingKey {
        case idTeam = "idTeam"
        case strTeam = "strTeam"
        case strTeamBadge = "strTeamBadge"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
        strTeam = try values.decodeIfPresent(String.self, forKey: .strTeam)
        strTeamBadge = try values.decodeIfPresent(String.self, forKey: .strTeamBadge)
    }

}
