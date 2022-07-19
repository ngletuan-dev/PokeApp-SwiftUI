//
//  PokeDetailViewModel.swift
//  iOS_PokeApp
//
//  Created by Hung Le on 16/07/2022.
//

import Foundation

final class PokeDetailViewModel: ObservableObject {
    @Published var pokemonDetails: PokemonDetail?

    func getPokemonDetails(pokemon: Pokemon) {
        PokemonAPI.shared.getPokemonDetail(url: pokemon.url) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }

    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        return string
    }
}
