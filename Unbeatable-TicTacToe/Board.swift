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
    var boardState = BoardState.ongoing
    var spots = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    enum BoardState {
        case ongoing
        case winner
        case draw
    }
    
    func outputBoard() {
        print("TicTacToe")
        print(spots[6...8])
        print(spots[3...5])
        print(spots[0...2])
    }
    
    // Check all possible winning permutations, if one is found return true, else return false
    func isWinningState(board: Board, player: Player.PlayerSymbol) -> Bool {
        if (board.spots[0] == player.rawValue && board.spots[1] == player.rawValue && board.spots[2] == player.rawValue) ||
           (board.spots[3] == player.rawValue && board.spots[4] == player.rawValue && board.spots[5] == player.rawValue) ||
           (board.spots[6] == player.rawValue && board.spots[7] == player.rawValue && board.spots[8] == player.rawValue) ||
           (board.spots[0] == player.rawValue && board.spots[3] == player.rawValue && board.spots[6] == player.rawValue) ||
           (board.spots[1] == player.rawValue && board.spots[4] == player.rawValue && board.spots[7] == player.rawValue) ||
           (board.spots[2] == player.rawValue && board.spots[5] == player.rawValue && board.spots[8] == player.rawValue) ||
           (board.spots[0] == player.rawValue && board.spots[4] == player.rawValue && board.spots[8] == player.rawValue) ||
           (board.spots[2] == player.rawValue && board.spots[4] == player.rawValue && board.spots[6] == player.rawValue)
        {
            return true
        } else {
            return false
        }
    }
    
    func isValidMove(_ move: Int) -> Bool {
        if board.spots[move - 1] != "X" || board.spots[move - 1] != "O" {
            return true
        } else {
            return false
        }
    }
    
    func copy() -> Board {
        var result = Board()
        result.spots = self.spots
        return result
    }
}
