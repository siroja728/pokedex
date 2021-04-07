//
//  PokemonDetail.swift
//  Pokedex (iOS)
//
//  Created by Sergiy Yemelyanov on 06.04.2021.
//

import SwiftUI
import Kingfisher

struct PokemonDetail: View {
    let detailUrl: String
    @ObservedObject var pokemonDetailsViewModel: PokemonDetailViewModel = PokemonDetailViewModel(detailUrl: "")
    
    init(detailUrl: String) {
        self.detailUrl = detailUrl
        self.pokemonDetailsViewModel = PokemonDetailViewModel(detailUrl: detailUrl)
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: pokemonDetailsViewModel.pokemonDetails.sprites.other.officialArtwork.front_default))
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .background(Color("cyan"))
                .cornerRadius(250)
                .shadow(color: Color("cyan"), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            Text(pokemonDetailsViewModel.pokemonDetails.name.uppercased())
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                .padding([.vertical], 10)
            Text("Height: \(pokemonDetailsViewModel.pokemonDetails.height)")
                .font(.title2)
            Text("Weight: \(pokemonDetailsViewModel.pokemonDetails.weight)")
                .font(.title2)
            Spacer()
        }
        .padding(.horizontal, 10)
    }

}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonDetail(detailUrl: "https://pokeapi.co/api/v2/pokemon/1/")
        }
    }
}
