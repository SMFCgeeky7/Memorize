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
            CardView(isFaceup: true)
            CardView(isFaceup: true)
        }
        .foregroundStyle(.green)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceup = false
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 15)
            
            if isFaceup {
            base.foregroundStyle(.white)
            base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10, 2]))
                Text("🎶")
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

