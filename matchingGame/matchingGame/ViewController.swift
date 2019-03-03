//
//  ViewController.swift
//  matchingGame
//
//  Created by JustinCaty<3 on 3/1/19.
//  Copyright © 2019 Justin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingModel(numberOfPairsOfCards: (buttonArray.count + 1) / 2)
//    var flipCount: Int = 0 {
//        didSet {
//            flipCountLabel.text = "\(flipCount)"
//        }
//    }
    
    @IBOutlet var buttonArray: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = buttonArray.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in buttonArray.indices {
            let button = buttonArray[index]
            let card = game.cards[index]
            if card.isMatched == true {
                buttonArray[index].isEnabled = false
            }
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched  ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    var emojis = ["🦠","🐛","🐞","🐠","🐜","🐚","🎸","👫","🔭", "🐶"]
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojis.count > 0  {
            let random = Int(arc4random_uniform(UInt32(emojis.count)))
            emoji[card.identifier] = emojis.remove(at: random)
        }

       return emoji[card.identifier] ?? "?"
    }
}

