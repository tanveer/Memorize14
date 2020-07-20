//
//  MemoryGameViewModel.swift
//  Memorize14
//
//  Created by Tanveer Bashir on 7/19/20.
//

import Foundation


class MemoryGameViewModel {
    private var viewModel: MemoryGame<String> = createMemoryGameCards()
    
    static func createMemoryGameCards()-> MemoryGame<String> {
        let emojis = Bundle.main.decode([Emoji].self, file:  "emojis.json")
        
        let random = Int.random(in: 2..<emojis.count)
        return MemoryGame(numberOfMemoryGameCard: random) { pairindex in
            return emojis[pairindex].emoji
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        viewModel.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        return viewModel.choose(card: card)
    }
}
