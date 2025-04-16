//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sebastian Fernandez Conde on 4/4/25.
//


import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    
    private static let emojis = ["⭐️", "🙏🏻", "❤️", "😎", "FM", "🎶", "💕", "Z", "😈", "😍", "👘", "🩱", "🐷", "🙃", "💫", "🚨", "🚙", "⭐️", "🙏🏻", "❤️", "😎", "FM", "🎶", "💕", "Z", "😈", "🔋", "⌚️", "🖲️", "🗃️", "🎙️", "📱", "🎵", "🐷", "💫", "👘", "🩱", "🐷", "🙃", "💫"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairOfCards: 9) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }else{
                return "NO CARD FOUND"
            }
        }
    }
    
    @Published private var model = createMemoryGame();
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
