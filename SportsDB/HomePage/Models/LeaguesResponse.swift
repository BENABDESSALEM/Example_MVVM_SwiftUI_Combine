//
//  LeaguesResponse.swift
//  SportsDB
//
//  Created by Wajih Benabdessalem on 7/2/2023.
//

import Foundation

struct LeaguesResponse : Codable {
    let leagues : [League]?

    enum CodingKeys: String, CodingKey {
        case leagues = "leagues"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        leagues = try values.decodeIfPresent([League].self, forKey: .leagues)
    }
}

struct League : Codable {
    let idLeague,strLeague : String?
    
    enum CodingKeys: String, CodingKey {
        case idLeague = "idLeague"
        case strLeague = "strLeague"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
        strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
    }
}
