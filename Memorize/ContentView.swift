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
            CardView(faceUp: true)
            CardView()
            CardView()
            CardView()

        }
            .foregroundColor(.orange)
            .padding()
    }
}

struct CardView: View{
    var faceUp = false
    
    
    var body: some View{
        if faceUp{
            ZStack(content: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text ("👻").font(.largeTitle)
                   })
        }
        else{
            ZStack(content: {
                RoundedRectangle(cornerRadius: 12)
                   })
        }
        
    }
}

#Preview {
    ContentView()
}
