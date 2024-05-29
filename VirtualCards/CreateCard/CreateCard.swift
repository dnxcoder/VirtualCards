//
//  CreateCard.swift
//  VirtualCards
//
//  Created by Denis Coder on 5/22/24.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width;

struct CreateCard: View {
    
    @State var cardNumber: String = "";
    @State var cardName: String = "";
    @State var cardExp: String = "";
    @State var chosenPattern: PatternModel = PatternModel(
        id: UUID(), name: "", type: .nations, backgroundThumbImage: "", backgroundImage: "usa-background", fontColor: .red
    );
    
    
    func handleChoosePattern (pattern:PatternModel) {
        print(pattern.backgroundImage, pattern.name)
        self.chosenPattern = pattern;
    }
    
    var body: some View {
        
        VStack(){
            
            Text("Add Card")
            
            Card(cardPattern: self.chosenPattern, cardNumber: self.$cardNumber,
                 cardExp: self.$cardExp,cardName: self.$cardName  )
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(dataPatterns){ pattern in
                        
                        PatternComponent(patternProps: pattern)
                            .onTapGesture {
                                handleChoosePattern(pattern: pattern)
                            }
                    }
                }.padding(.leading,20)
                
            }.scrollClipDisabled()
            CustomTextField(placeHolder: "XXXX XXXX XXXX XXXX", TextFieldValue: self.$cardNumber)
            CustomTextField(placeHolder: "EXP DATE", TextFieldValue: self.$cardExp)
            CustomTextField(placeHolder: "YOUR NAME", TextFieldValue: self.$cardName)
            Spacer()
        }
    }
}

struct Card: View {
    
    let cardPattern: PatternModel
    @Binding var cardNumber: String;
    @Binding var cardExp: String;
    @Binding var cardName: String;
    
    var body: some View {
        
        HStack{
            VStack(alignment:.leading){
                Spacer()
                Text(self.cardNumber == "" ? "XXXX XXXX XXXX XXXX" : self.cardNumber)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(self.cardPattern.fontColor.color)
                    .padding(.bottom, 1)
                Text(self.cardExp == "" ? "Exp: 05/26" : "Exp " + self.cardExp)
                    .foregroundColor(self.cardPattern.fontColor.color)
                    .padding(.bottom, 1)
                    .fontWeight(.semibold)
                Text(self.cardName == "" ? "GEORGE WASHINGTON" : self.cardName )
                    .fontWeight(.bold)
                    .foregroundColor(self.cardPattern.fontColor.color)
            }
            .padding(.leading,20)
            Spacer()
        }
        .frame(width: screenWidth - 40, height: 200)
        .background(Image(cardPattern.backgroundImage)
            .resizable()
            .aspectRatio(contentMode: .fill))
        .padding(.bottom, 15)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
        
        
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
        .cornerRadius(10)
        .clipped(antialiased: false)
        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 10)
    }
}

struct CustomTextField: View {
    
    var placeHolder: String = "";
    @State private var creditCardNumber: String = ""
    @Binding var TextFieldValue: String;
    
    var body: some View{
        HStack{
            TextField(self.placeHolder,text: self.$TextFieldValue)
                .font(.system(size: 15))
                .padding(.leading,20)
                .keyboardType(.numberPad)
                .frame(width: screenWidth-20, height:50)
                .background(Color.white)
                .cornerRadius(10,antialiased: true)
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 10, y: 15)
                .padding(.top,5)
        }
    }
}


#Preview {
    CreateCard()
}
