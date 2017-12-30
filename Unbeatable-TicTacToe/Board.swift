//
//  Board.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

struct Board {
    var movesMade = 0
    
    var space1 = "1"
    var space2 = "2"
    var space3 = "3"
    var space4 = "4"
    var space5 = "5"
    var space6 = "6"
    var space7 = "7"
    var space8 = "8"
    var space9 = "9"
    
    func outputBoard() {
        var spaceArray = [[space1, space2, space3], [space4, space5, space6], [space7, space8, space9]]
        for i in 0..<spaceArray.count {
            print("\(spaceArray[spaceArray.count - 1 - i])\n")
        }
    }
    
    static func makeMove(board: Board, space: String, withSymbol: String) -> Board {
        var newBoard = board
        switch space {
            case "1": newBoard.space1 = withSymbol
            case "2": newBoard.space2 = withSymbol
            case "3": newBoard.space3 = withSymbol
            case "4": newBoard.space4 = withSymbol
            case "5": newBoard.space5 = withSymbol
            case "6": newBoard.space6 = withSymbol
            case "7": newBoard.space7 = withSymbol
            case "8": newBoard.space8 = withSymbol
            case "9": newBoard.space9 = withSymbol
        default:
            print("Please choose a valid board space.")
        }
        
        return newBoard
    }
}
