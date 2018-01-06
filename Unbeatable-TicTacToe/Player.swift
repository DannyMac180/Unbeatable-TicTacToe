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
    var symbol: PlayerSymbol = .empty
    var hasNextMove: Bool = false
    var isWinner: Bool = false
    var playerType: PlayerType = .computer
    
    enum PlayerType {
        case human
        case computer
    }
    
    enum PlayerSymbol: String {
        case X = "X"
        case O = "O"
        case empty = ""
    }
    
    func getPlayerName(playerNumber: Int) -> String {
        print("What is Player \(playerNumber)'s name?")
        let input = console.getInput()
        return input
    }
    
    func getPlayerSymbol(_ player: Player) -> String {
        print("Please choose the number associated with the symbol you would like \(player.name) to have:\n1. X 2. 0")
        let input = Int(console.getInput())
        
        if input == 1 {
            return "X"
        } else {
            return "O"
        }
    }
}
