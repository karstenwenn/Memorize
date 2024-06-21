//
//  ContentView.swift
//  Memorize
//
//  Created by Karsten Wennerlund on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis: [String] = ["👻","👻","👻","👻"]
            
            //ForEach(0..<4)
            
            ForEach(emojis.indices, id: \.self){ num in
                CardView(content: emojis[num], isFaceUp: false)

            }

        }
            .foregroundColor(.orange)
            .padding()
    }
}

struct CardView: View{
    let content: String

    @State var isFaceUp = false
    
    
    var body: some View{
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text (content).font(.largeTitle)
            }
            else{
                base.fill()
            }
        } .onTapGesture {
            isFaceUp.toggle()
        }
               
        
    }
}

#Preview {
    ContentView()
}
