//
//  ContentView.swift
//  VirtualCards
//
//  Created by Denis Coder on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    
    let imageNames = ["usa-card-image","canada-image","brazil-image","shiba-image"]
    let screenWidth = UIScreen.main.bounds.width;
    
    var body: some View {
        VStack {
            ScrollView{
                ForEach(imageNames.indices, id: \.self){ index in
                    ZStack(alignment:.center){
                        Image(imageNames[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: screenWidth-10)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.4), radius: 10, x: 10, y: 10 )
                    }
                    .padding(.all,20)
                }
            }.frame(minWidth: screenWidth)
                .scrollIndicators(.hidden)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }.edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    ContentView()
}
