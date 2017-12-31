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
    
    func assignOppositeSymbol() -> String {
        if player1.symbol == "X" {
            return "O"
        } else {
            return "X"
        }
    }
    
    func assignFirstMove() {
        print("Please choose the number associated with the player you want to go first:\n1. \(player1.name) 2. \(player2.name)")
        let input = Int(console.getInput())
        
        if input == 1 {
            player1.hasNextMove = true
        } else {
            player2.hasNextMove = true
        }
    }
}
