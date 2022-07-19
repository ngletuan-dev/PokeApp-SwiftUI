//
//  LoadableImageView.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct LoadableImageContentView: View {
    @StateObject var downloader = Downloader()
    
    var urlString: String
    
    init(with urlString: String) {
        self.urlString = urlString
    }
    
    var stateContent: AnyView {
        if let image = UIImage(data: downloader.data) {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            )
        } else {
            return AnyView(
                ZStack {
                    ProgressView()
                        .frame(width: 75, height: 75)
                }
                    .scaledToFit()
                    .clipShape(Circle())
            )
        }
            
    }
    
    var body: some View {
        HStack {
            stateContent
        }
        .onAppear {
            downloader.loadAPI(urlString: urlString)
        }
    }
}

struct LoadableImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImageContentView(with: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")
            .frame(width: 75, height: 75)
    }
}
