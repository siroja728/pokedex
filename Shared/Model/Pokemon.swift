//
//  Pokemon.swift
//  test (iOS)
//
//  Created by Sergiy Yemelyanov on 01.04.2021.
//

import Foundation

// Pokedex list item structure
struct PokemonItem: Decodable, Identifiable {
    var id = UUID()
    
    let name: String
    let url: String
    
    private enum CodingKeys : String, CodingKey { case name, url }
}

// Pokedex list structure
struct Pokemons: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonItem]
}

// Detailed pokemon info
struct PokemonDetails: Decodable {
    struct Sprites: Decodable {
        struct Other: Decodable {
            struct OfficialArtwork: Decodable {
                let front_default: String
            }
            
            let officialArtwork: OfficialArtwork
            
            enum CodingKeys: String, CodingKey {
                case officialArtwork = "official-artwork"
            }
        }
        let other: Other
    }
    
    let name: String
    let sprites: Sprites
    let height: Int
    let weight: Int
}
