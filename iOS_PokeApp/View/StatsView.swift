//
//  StatsView.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct StatsView: View {
    let stats: [Stats]
    
    var body: some View {
        HStack(alignment: .center, spacing: 60) {
            Text("DEFENSE: \(stats.first(where: { $0.stat?.name == "defense" })?.baseStat ?? 0)")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.blue)
                .scaledToFit()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.blue, lineWidth: 2)
                            .frame(width: 150, height: 60)
                    )
            
            Text("ATTACK: \(stats.first(where: { $0.stat?.name == "attack" })?.baseStat ?? 0)")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.red)
                .scaledToFit()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.red, lineWidth: 2)
                            .frame(width: 150, height: 60)
                    )
        }
        .padding()
        .scaledToFit()
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(stats: [])
            .environmentObject(PokeDetailViewModel())
            .environmentObject(PokeViewModel())
    }
}
