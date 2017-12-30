//
//  Player.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

class Player {
    var name: String = ""
    var symbol: String = ""
    var hasNextMove: Bool = false
    var isWinner: Bool = false
    var playerType: PlayerType = .computer
    
    enum PlayerType {
        case human
        case computer
    }
}
