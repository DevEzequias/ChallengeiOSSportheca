//
//  SporthecaModel.swift
//  ChallengeiOSSportheca
//
//  Created by Ezequias Santos on 01/12/22.
//

import Foundation

// MARK: - SporthecaResponse
struct SporthecaResponse: Codable {
    let status: Int?
    let object: [Object]?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case object = "Object"
    }
}

// MARK: - Object
struct Object: Codable {
    let player: Player?

    enum CodingKeys: String, CodingKey {
        case player = "Player"
    }
}

// MARK: - Player
struct Player: Codable {
    let img: String?
    let name: String?
    let percentual: Double?
    let pos, country: String?
    let barras: Barras?

    enum CodingKeys: String, CodingKey {
        case img, name, percentual, pos, country
        case barras = "Barras"
    }
}

// MARK: - Barras
struct Barras: Codable {
    let worldCupsWins, worldCupsPlayed: WorldCups?

    enum CodingKeys: String, CodingKey {
        case worldCupsWins = "Copas_do_Mundo_Vencidas"
        case worldCupsPlayed = "Copas_do_Mundo_Disputadas"
    }
}

// MARK: - CopasDoMundoDas
struct WorldCups: Codable {
    let max, pla, pos: Int
}
