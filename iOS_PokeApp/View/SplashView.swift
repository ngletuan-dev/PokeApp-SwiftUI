//
//  SplashView.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import SwiftUI

struct SplashView: View {
    @State var animationValues: [Bool] = Array(repeating: false, count: 10)
    
    var body: some View {
        ZStack{
            //ContentView
            ContentView()
            
            //SplashView
            if !animationValues[2] {
                //SplashView
                ZStack(alignment: .center){
                    Image("Landscape")
                        .resizable()
                        .frame(width: 800, height: 950)
                        .scaledToFit()
                    Image("Pokemon-Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 600, alignment: .top)
                }
                .environment(\.colorScheme, .light)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.3).delay(0.4)){
                    animationValues[0] = false
                }
                //Ending SplashView
                withAnimation(.easeInOut(duration: 0.5).delay(0.8)){
                    animationValues[1] = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    animationValues[2] = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
