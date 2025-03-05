//
//  ContentView.swift
//  Memorize
//
//  Created by Sebastian Fernandez Conde on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["⭐️", "🙏🏻", "❤️", "😎", "FM", "🎶", "💕", "Z", "😈", "😍", "👘", "🩱", "🐷", "🙃", "💫", "🚨", "🚙", "⭐️", "🙏🏻", "❤️", "😎", "FM", "🎶", "💕", "Z", "😈", "🔋", "⌚️", "🖲️", "🗃️", "🎙️", "📱", "🎵", "🐷", "💫", "👘", "🩱", "🐷", "🙃", "💫"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards;
            }
            Spacer()
            cardAdjuster;
        }
    }
    
    var cards: some View {
        
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
                
            }
            .foregroundStyle(.green)
            .padding()
        
        
    }
    
    var cardAdjuster: some View {
        HStack {
            cardRemover;
            Spacer()
            cardAdder;
        }
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .font(.largeTitle)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
        
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 15)
            
            Group {
            base.foregroundStyle(.white)
            base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10, 2]))
                Text(content)
                    .font(.largeTitle)
                    .padding()
                .foregroundStyle(.red)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

