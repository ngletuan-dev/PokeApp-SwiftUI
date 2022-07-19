//
//  ContentView.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PokeViewModel()
    @StateObject var pokeDetailVM = PokeDetailViewModel()
    
    @State var isFavorite = false
    
    let urlImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.filteredPokemon) {pokemon in
                    HStack{
                        //Image Pokemon
                        LoadableImageContentView(with: "\(urlImage)\(viewModel.getPokemonIndex(pokemon: pokemon)).png")
                        
                        //Pokemon Details
                        NavigationLink(destination: PokemonViewDetail(pokemon: pokemon).environmentObject(PokeDetailViewModel())) {
                            VStack (alignment: .leading) {
                                Text("\(pokemon.name)".capitalized).font(.system(size: 20, weight: .bold, design: .default))
                            }
                        }
                        Button(action: {
                            isFavorite.toggle()
                        }) {
                            Image(isFavorite ? "star-solid" :"star-regular")
                                .resizable()
                                .frame(width: 40, height: 37.5, alignment: .center)
                                .foregroundColor(.yellow)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .animation(.easeIn(duration: 0.3), value: viewModel.filteredPokemon.count)
            .navigationTitle("My Pokemons")
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
