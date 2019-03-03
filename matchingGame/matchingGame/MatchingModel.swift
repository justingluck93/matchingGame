//
//  MatchingModel.swift
//  matchingGame
//
//  Created by JustinCaty<3 on 3/1/19.
//  Copyright © 2019 Justin. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

class MatchingModel
{
    var cards = [Card]()
    var indexOfFlipedCard: Int?
    
    func chooseCard(at index: Int) {
        if indexOfFlipedCard != index {
            if let matchIndex = indexOfFlipedCard {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfFlipedCard = nil
        } else {
                for flipDown in cards.indices {
                    if cards[flipDown].isMatched == false {
                        cards[flipDown].isFaceUp = false
                    }
                }
                cards[index].isFaceUp = true
                indexOfFlipedCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle()
    }
    
}
