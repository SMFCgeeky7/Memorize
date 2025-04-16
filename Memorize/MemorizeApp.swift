//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sebastian Fernandez Conde on 10/2/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
