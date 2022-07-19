//
//  PokeViewModel.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import Foundation

final class PokeViewModel: ObservableObject {
    
    private let urlString = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0"
    
    @Published var pokemonList: [Pokemon] = []
    @Published var searchText = ""
    
    @Published var apiState: APIState = .loading
    
    init() {
        loadAPI()
    }
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }

    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon){
            return index + 1
        }
        return 0
    }
    
    //API
    func loadAPI() {
        guard let url = URL(string: urlString) else {
            apiState = .failure(APIError.error("URL Error"))
            return
        }
        
        apiState = .loading
        
        URLSession.shared.dataTask(with: url) { [self] (data, _, _) in
            guard let data = data else {
                self.apiState = .failure(APIError.error("Data Error"))
                return
            }
            
            do {
                let pokemonPage = try JSONDecoder().decode(PokemonPage.self, from: data)
                DispatchQueue.main.async {
                    self.pokemonList = pokemonPage.results
                    self.apiState = .success
                }
                print(pokemonPage)
            } catch {
                self.apiState = .failure(APIError.error(error.localizedDescription))
            }
        }.resume()
    }
}

