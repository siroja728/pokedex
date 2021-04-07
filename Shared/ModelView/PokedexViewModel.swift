//
//  PokedexViewModel.swift
//  test (iOS)
//
//  Created by Sergiy Yemelyanov on 01.04.2021.
//

import SwiftUI

class PokedexViewModel: ObservableObject {
    @Published var pokemons = Pokemons.init(count: 0, next: nil, previous: nil, results: [])
    let baseUrl = "https://pokeapi.co/api/v2/pokemon?limit=100"
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let pokemons = try JSONDecoder().decode(Pokemons.self, from: data!)
                  
                DispatchQueue.main.async {
                    self.pokemons = pokemons
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
