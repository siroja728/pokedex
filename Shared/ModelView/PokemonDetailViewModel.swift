//
//  PokemonDetailViewModel.swift
//  Pokedex (iOS)
//
//  Created by Sergiy Yemelyanov on 06.04.2021.
//

import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    let detailUrl: String
    @Published var pokemonDetails = PokemonDetails.init(
        name: "",
        sprites: PokemonDetails.Sprites.init(
            other: PokemonDetails.Sprites.Other.init(
                officialArtwork: PokemonDetails.Sprites.Other.OfficialArtwork.init(front_default: "")
            )
        ),
        height: 0,
        weight: 0
    )
    
    init(detailUrl: String) {
        self.detailUrl = detailUrl
        fetchDetailInfo()
    }
    
    func fetchDetailInfo() {
        guard let url = URL(string: detailUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let pokemonDetailsData = try JSONDecoder().decode(PokemonDetails.self, from: data!)
                print(pokemonDetailsData)
                  
                DispatchQueue.main.async {
                    self.pokemonDetails = pokemonDetailsData
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
