//
//  AbilityView.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct AbilityView: View {
    @EnvironmentObject var pokeEffectVM: PokeEffectViewModel
    let abilities: [Abilities]
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(abilities, id: \.self) { item in
                Text("\(item.ability?.name ?? " ")".capitalized)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color.gray)
                    .padding(5)
                    .onAppear {
                        pokeEffectVM.getPokemonEffect(abilityName: item)
                    }

                Text("\(pokeEffectVM.abilityDetail?.effectEntried.first(where: {$0.language?.name == "en"})?.effect ?? " ")".capitalized)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct AbilityView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityView(abilities: [])
            .environmentObject(PokeDetailViewModel())
            .environmentObject(PokeViewModel())
            .environmentObject(PokeEffectViewModel())
    }
}
