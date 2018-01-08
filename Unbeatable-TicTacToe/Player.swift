//
//  Player.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import GameplayKit

class Player: NSObject {
    
    enum Symbol: String {
        case empty = "#"
        case X = "X"
        case O = "O"
    }
    
    var symbol: Symbol
    var name: String
    
    static var allPlayers = [
        Player(.X, "PlayerOne"),
        Player(.O, "PlayerTwo")
    ]
    
    var opponent: Player {
        if symbol == .O {
            return Player.allPlayers[0]
        } else {
            return Player.allPlayers[1]
        }
    }
    
    init(_ symbol: Symbol, _ name: String) {
        self.symbol = symbol
        self.name = name
    }
}
