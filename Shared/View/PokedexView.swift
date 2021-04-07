//
//  PokedexView.swift
//  test (iOS)
//
//  Created by Sergiy Yemelyanov on 31.03.2021.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokedexViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 15) {
                    ForEach(viewModel.pokemons.results) {
                        pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
                .padding(10)
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
