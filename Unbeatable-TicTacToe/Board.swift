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
    var spots = ["1", "O", "O", "X", "5", "X", "O", "8", "X"]
    
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

    func isValidMove(_ move: Int) -> Bool {
        if board.spots[move - 1] != "X" || board.spots[move - 1] != "O" {
            return true
        } else {
            return false
        }
    }
    
    func isWinningState(board: Board, playerSymbol: String) -> Bool {
        if  (board.spots[0] == playerSymbol && board.spots[1] == playerSymbol && board.spots[2] == playerSymbol) ||
            (board.spots[3] == playerSymbol && board.spots[4] == playerSymbol && board.spots[5] == playerSymbol) ||
            (board.spots[6] == playerSymbol && board.spots[7] == playerSymbol && board.spots[8] == playerSymbol) ||
            (board.spots[0] == playerSymbol && board.spots[3] == playerSymbol && board.spots[6] == playerSymbol) ||
            (board.spots[1] == playerSymbol && board.spots[4] == playerSymbol && board.spots[7] == playerSymbol) ||
            (board.spots[2] == playerSymbol && board.spots[5] == playerSymbol && board.spots[8] == playerSymbol) ||
            (board.spots[0] == playerSymbol && board.spots[4] == playerSymbol && board.spots[8] == playerSymbol) ||
            (board.spots[2] == playerSymbol && board.spots[4] == playerSymbol && board.spots[6] == playerSymbol)
        {
            return true
        } else {
            return false
        }
    }
}
