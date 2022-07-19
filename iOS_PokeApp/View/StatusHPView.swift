//
//  StatusHPView.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct StatusHPView: View {
    let stats: [Stats]
    
    var body: some View {
        HStack(alignment: .center, spacing: 5){
            Text("HP \(stats.first(where: { $0.stat?.name == "hp" })?.baseStat ?? 0)")
                .font(.system(size: 15, weight: .bold, design: .default))
                .foregroundColor(.yellow)
        }
        .frame(width: 60, height: 60)
        .background(.blue)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.black, lineWidth: 2))
        .scaledToFit()
    }
}

struct StatusHPView_Previews: PreviewProvider {
    static var previews: some View {
        StatusHPView(stats: [])
            .environmentObject(PokeDetailViewModel())
            .environmentObject(PokeViewModel())
    }
}
