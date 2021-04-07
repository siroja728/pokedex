//
//  PokemonCell.swift
//  test (iOS)
//
//  Created by Sergiy Yemelyanov on 31.03.2021.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: PokemonItem
    
    init(pokemon: PokemonItem) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        NavigationLink(destination: PokemonDetail(detailUrl: pokemon.url)) {
            HStack {
                Text(pokemon.name.capitalized)
                    .foregroundColor(.white)
                    .font(.headline).bold()
                    .lineLimit(1)
                    .padding(5)
                    .frame(maxWidth: .infinity)
                Image("pokebol")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .cornerRadius(50)
            }
            .padding(5)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(color: .blue, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: PokemonItem.init(id: UUID(), name: "Ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"))
    }
}
