//
//  PokeModel.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Identifiable, Codable, Equatable {
    
    var id: UUID {
        get {
            UUID()
        }
    }
    let name: String
    let url: String
//    var isFavourite: Bool
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    
}

// MARK: - Add for detail here
struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let species: Species?
    let abilities: [Abilities]?
    let stats: [Stats]?
    let types: [TypeElement]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case height = "height"
        case weight = "weight"
        case species = "species"
        case abilities = "abilities"
        case stats = "stats"
        case types = "types"
    }
    
}


//MARK: - Species
struct Species: Codable, Hashable {
    static func == (lhs: Species, rhs: Species) -> Bool {
        return lhs.name == rhs.name || lhs.url == rhs.url
    }
    
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

//MARK: - Ability
struct Abilities: Codable, Hashable {
    static func == (lhs: Abilities, rhs: Abilities) -> Bool {
        return lhs.ability == rhs.ability
    }
    
    var ability: Species?
    var isHidden: Bool?
    var slot: Int?
    
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
        case isHidden = "is_hidden"
        case slot = "slot"
    }
}

struct AbilityDetail: Codable {
    var effectEntried: [EffectEntried]

    enum CodingKeys: String, CodingKey {
        case effectEntried = "effect_entries"
    }
}

//MARK: - Stats
struct Stats: Codable {
    var baseStat: Int?
    var effort: Int?
    var stat: Species?
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
}

//MARK: - TypeElement
struct TypeElement: Codable {
    var slot: Int?
    var type: Species?
    
    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}

//MARK: - Effect
struct EffectEntried: Codable {
    var effect: String?
    var language: Species?
    var shortEffect: String?
    
    enum CodingKeys: String, CodingKey {
        case effect = "effect"
        case language = "language"
        case shortEffect = "short_effect"
    }
}
