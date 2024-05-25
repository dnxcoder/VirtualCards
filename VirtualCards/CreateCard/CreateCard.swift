//
//  CreateCard.swift
//  VirtualCards
//
//  Created by Denis Coder on 5/22/24.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width;

struct CreateCard: View {
    
    @State var CardNumber: String = "";
    @State var CardName: String = "";
    @State var ChosenPattern: PatternModel = PatternModel(
        id: UUID(), name: "", type: .nations, backgroundThumbImage: "", backgroundImage: ""
    );
    
    
    func handleChoosePattern (pattern:PatternModel) {
        print(pattern.backgroundImage, pattern.name)
        self.ChosenPattern = pattern;
    }
    
    var body: some View {
        
        VStack(){
            
            Text("Add Card")
            
            Card(cardPattern: self.ChosenPattern)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(dataPatterns){ pattern in
                        
                        PatternComponent(patternProps: pattern)
                            .onTapGesture {
                                handleChoosePattern(pattern: pattern)
                            }
                    }
                }.padding(.leading,20)
            }
            
            CustomTextField(placeHolder: "0000 0000 0000 0000", TextFieldValue: self.$CardNumber)
            CustomTextField(placeHolder: "Your Name", TextFieldValue: self.$CardName)
            Spacer()
        }
    }
}

struct Card: View {
    
    let cardPattern: PatternModel
    
    var body: some View {
        
        VStack(alignment:.center){
            Spacer()
            Text("---- ---- ---- ----")
            Spacer().frame(height: 20)
            HStack{
                Text("Exp. -- / --")
                    .padding(.leading, 20)
                Spacer()
            }
            Spacer().frame(height: 20)
            
            HStack{
                Spacer()
                Text("NARUTO UZUMAKI")
                    .padding(.trailing, 20)
            }
            Spacer().frame(height: 20)
        }
        .background(Image(cardPattern.backgroundImage))
        .frame(width: screenWidth - 40, height: 200)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/,width: 5)
        .cornerRadius(10)
        
        
    }
}

struct PatternComponent: View {
    
    let patternProps: PatternModel
    
    
    var body: some View{
        VStack{
            Image("\(self.patternProps.backgroundThumbImage)")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 100, height: 100)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
        .cornerRadius(10)
    }
}

struct CustomTextField: View {
    
    var placeHolder: String = "";
    @Binding var TextFieldValue: String;
    
    var body: some View{
        HStack{
            TextField(self.placeHolder,text: self.$TextFieldValue)
                .padding(.leading,20)
                .keyboardType(.numberPad)
        }
        .frame(width: screenWidth-20, height:60)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/,width: 4)
        .cornerRadius(10,antialiased: true)
        .padding(.top,20)
        
    }
}


#Preview {
    CreateCard()
}
