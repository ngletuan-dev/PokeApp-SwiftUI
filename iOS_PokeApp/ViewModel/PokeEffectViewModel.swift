//
//  PokeEffectViewModel.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import Foundation
import SwiftUI

final class PokeEffectViewModel: ObservableObject {
    @Published var abilityDetail: AbilityDetail?
    
    func getPokemonEffect(abilityName: Abilities) {
        PokemonAPI.shared.getPokemonEffect(url: abilityName.ability.flatMap{$0.url ?? " "}!) { data in
            DispatchQueue.main.async {
                self.abilityDetail = data
            }
        }
    }
}

