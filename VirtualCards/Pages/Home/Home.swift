//
//  Index.swift
//  VirtualCards
//
//  Created by Denis Coder on 5/22/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        let imageNames = ["usa-card-image","canada-image","brazil-image","shiba-image"]
        let screenWidth = UIScreen.main.bounds.width;
        
        
        NavigationView{
            VStack {
                
                ScrollView{
                    
                    Header()
                    
                    ListOfCards(imageNames: imageNames)
             
                }.frame(minWidth: screenWidth)
                    .scrollIndicators(.hidden)
            }.edgesIgnoringSafeArea(.top)
        }
       
    }
}


struct Header : View {
    var body: some View {
        HStack(alignment:.center, spacing: 20){
            Text("Cards")
            Spacer()
            NavigationLink(destination: CreateCard()){
                ZStack(alignment:.center){
                    Circle().fill(.gray).frame(width: 40)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                }.padding(.trailing,20)
            }
        }
        .padding(.leading,20)
        .padding(.top,60)
    }
}

struct ListOfCards: View {
    let imageNames: [String]

    var body: some View {
        ForEach(imageNames.indices, id: \.self) { index in
            ZStack(alignment: .center) {
                Image(imageNames[index])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: UIScreen.main.bounds.width - 10)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
            }
            .padding(.all, 20)
        }
    }
}

func handleGoToAddCard (){
    print("just something that i want to try")
}

#Preview {
    Home()
}
