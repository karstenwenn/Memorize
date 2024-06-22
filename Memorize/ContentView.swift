//
//  ContentView.swift
//  Memorize
//
//  Created by Karsten Wennerlund on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["A","2","3","4","5","6","7","8","9","10"]
    @State var cardCount: Int = 4
    
    //TRY TO TAKE AS MANY THINGS OUT OF BODY AS YOUCAN (PUT INTO VARIABLES, see below) TO GET THEM AS SPOKEN AS POSSIBLE
    //Try to look by Vstacks and Hstacks and see if they represent specific components
    
    var body: some View { //now this body is extremely readable andintuitive
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }

    //ForEach(0..<4) or emojis.indices

    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View{
        HStack{
        cardRemover
        Spacer()
        cardAdder
        }
        
    }

    
    
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }
               , label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count) //accounting for case where the cardCount is below nothing or above the amount of available cards.
    }
        
    
    var cardRemover: some View{
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")

    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus")
    }
    
    
    
    struct CardView: View{
        let content: String
        
        @State var isFaceUp = true
        
        
        var body: some View {
            
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
                
            
            } .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
}
#Preview {
    ContentView()
}
