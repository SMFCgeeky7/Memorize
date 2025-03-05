//
//  ContentView.swift
//  Memorize
//
//  Created by Sebastian Fernandez Conde on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["⭐️", "🙏🏻", "❤️", "😎", "FM"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.green)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceup = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 15)
            
            if isFaceup {
            base.foregroundStyle(.white)
            base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10, 2]))
                Text(content)
                    .font(.largeTitle)
                    .padding()
                .foregroundStyle(.red)
            } else {
                base
            }
        }
        .onTapGesture {
            
            
            isFaceup.toggle()
        }
    }
}

#Preview {
    ContentView()
}

