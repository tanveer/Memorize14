//
//  MemoryGame.swift
//  Memorize14
//
//  Created by Tanveer Bashir on 7/19/20.
//

import Foundation


struct MemoryGame<ContentType> {
    var cards: Array<Card>
    
    init(numberOfMemoryGameCard: Int, cardContentFactory: (Int) -> ContentType) {
        cards = Array<Card>()
        for pairOfIndex in 0..<numberOfMemoryGameCard {
            let content = cardContentFactory(pairOfIndex)
            cards.append(Card(contentType: content))
            cards.append(Card(contentType: content))
            cards.shuffle()
        }
    }
    
    func choose(card: Card){
        print("Chosen card: \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceup: Bool = true
        var isMatched: Bool = false
        var contentType: ContentType
        var id = UUID()
    }
}
