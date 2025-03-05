//
//  ContentView.swift
//  Memorize
//
//  Created by Sebastian Fernandez Conde on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceup: true)
            CardView(isFaceup: true)
            CardView(isFaceup: false)
            CardView(isFaceup: true)
        }
        .foregroundStyle(.green)
        .padding()
    }
}

struct CardView: View {
    var isFaceup: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceup {
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10, 2]))
                Text("🎶")
                    .font(.largeTitle)
                    .padding()
                .foregroundStyle(.red)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

#Preview {
    ContentView()
}

