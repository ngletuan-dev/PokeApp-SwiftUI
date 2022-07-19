//
//  AbilityView.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct TypeElementView: View {
    let typeElement: [TypeElement]
    
    var body: some View {
        let names = typeElement.compactMap{ $0.type?.name}
        
        HStack(alignment: .center, spacing: 100) {
            ForEach(names, id: \.self) {types in
                Text("\(types)".capitalized)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color.getColorType(type: types))
            }
        }
        .scaledToFit()
    }
}

struct TypeElementView_Previews: PreviewProvider {
    static var previews: some View {
        TypeElementView(typeElement: [])
            .environmentObject(PokeDetailViewModel())
            .environmentObject(PokeViewModel())
    }
}
