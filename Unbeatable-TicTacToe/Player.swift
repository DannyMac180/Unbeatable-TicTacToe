//
//  Player.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import GameplayKit

class Player: NSObject, GKGameModelPlayer {
    
    enum Symbol: String {
        case X = "X"
        case O = "O"
    }
    
    var symbol: Symbol
    var name: String
    var playerId: Int
    
    static var allPlayers = [
        Player(.X, "PlayerOne", 1),
        Player(.O, "PlayerTwo", 2)
    ]
    
    var opponent: Player {
        if symbol == .O {
            return Player.allPlayers[0]
        } else {
            return Player.allPlayers[1]
        }
    }
    
    init(_ symbol: Symbol, _ name: String, _ playerId: Int) {
        self.symbol = symbol
        self.name = name
        self.playerId = playerId
    }
}
