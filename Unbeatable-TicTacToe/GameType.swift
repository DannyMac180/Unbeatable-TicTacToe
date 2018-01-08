//
//  GameType.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/30/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

enum GameType: Int {
    case humanVersusHuman
    case humanVersusComputer
    case computerVersusComputer
    
    static func getGameType() -> GameType {
        print("Welcome to TicTacToe! \nPlease enter the number of the game type you want to play:\n1. Human vs. Human 2. Human vs. Computer 3. Computer vs. Computer.")
        let input = console.getInput()
        return GameType(rawValue: Int(input)!)!
    }
}
