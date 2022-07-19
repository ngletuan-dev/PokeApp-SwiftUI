//
//  PokemonDetail.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct PokemonViewDetail: View {
    @EnvironmentObject var pokeDetailVM: PokeDetailViewModel
    @EnvironmentObject var viewModel: PokeViewModel
    @StateObject var pokeEffectVM = PokeEffectViewModel()
    
    @State var isFavorite = false

    let pokemon: Pokemon

    let urlImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .center) {
                //Image Pokemon
                LoadableImageViewDetail(with: "\(urlImage)\(viewModel.getPokemonIndex(pokemon: pokemon)).png")
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 3))
                    .padding(.all, 5)
                
                //Stat HP
                VStack{
                    StatusHPView(stats: pokeDetailVM.pokemonDetails?.stats ?? [])
                    .padding(.bottom, 100)
                    .padding(.leading, 100)
                }
                .frame(width: 100, height: 100)
            }
            
            HStack(alignment: .center, spacing: 10){
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(isFavorite ? "star-solid" :"star-regular")
                        .resizable()
                        .frame(width: 40, height: 37.5, alignment: .center)
                        .foregroundColor(.yellow)
                }
                
                Text("\(pokemon.name)".capitalized)
                    .font(.system(size: 40, weight: .bold, design: .default))
            }
            .scaledToFit()
            
            //TypeElement
            TypeElementView(typeElement: pokeDetailVM.pokemonDetails?.types ?? [])
            
            //StatsView
            StatsView(stats: pokeDetailVM.pokemonDetails?.stats ?? [])
            
            //Ability
            AbilityView(abilities: pokeDetailVM.pokemonDetails?.abilities ?? [])
                .frame(width: 350, alignment: .leading)
                .environmentObject(pokeEffectVM)
        }
        .frame(width: 450, height: 700, alignment: .top)
        .onAppear {
            pokeDetailVM.getPokemonDetails(pokemon: pokemon)
        }
    }
}

struct PokemonViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonViewDetail(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokeDetailViewModel())
            .environmentObject(PokeViewModel())
            .environmentObject(PokeEffectViewModel())
    }
}
