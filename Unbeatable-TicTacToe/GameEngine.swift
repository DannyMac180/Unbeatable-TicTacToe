//
//  GameEngine.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/30/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

struct GameEngine {
    var computerPlayer = Player()
    var humanPlayer = Player()
    
    func getHumanMove(player: Player) -> Int {
        print("\(player.name), you're turn. Please enter the open space number where you want to place your next move:")
        let input = Int(console.getInput())!
        return input
    }
    
    func assignOppositeSymbol() -> String {
        if computerPlayer.symbol.rawValue == "X" {
            return "O"
        } else {
            return "X"
        }
    }
    
    func assignFirstMove(toPlayer: Player) {
        print("Please choose the number associated with the player you want to go first:\n1. \(computerPlayer.name) 2. \(humanPlayer.name)")
        let input = Int(console.getInput())
        
        if input == 1 {
            computerPlayer.hasNextMove = true
        } else {
            humanPlayer.hasNextMove = true
        }
    }
    
    func makeMove(_ board: Board, _ move: Int, _ player: Player.PlayerSymbol) -> Board {
        var newBoard = board
        newBoard.spots[move - 1] = player.rawValue // move - 1 so it writes to the proper index of the move chosen
        return newBoard
    }
    
    func availableSpots(_ board: Board) -> [String] {
        return board.spots.filter {$0 != "X" && $0 != "O"}
    }
    
    
    
    func miniMax(_ board: Board, _ player: Player.PlayerSymbol) -> Int {
        let openSpots = availableSpots(board)
        
        var scores: [Int] = []
        var moves: [Int] = []
        
        if board.isWinningState(board: board, player: self.computerPlayer.symbol) {
            return 10
        } else if openSpots.isEmpty {
            return 0
        } else if board.isWinningState(board: board, player: self.humanPlayer.symbol) {
            return -10
        }
        
        for move in 0..<openSpots.count {
            var nextBoard = board.copy()
            
            nextBoard = makeMove(nextBoard, move + 1, player)
            
            scores.append(miniMax(nextBoard, (player == .O ? .X : .O)))
            moves.append(move)
        }
        
        if self.computerPlayer.symbol == player {
            let bestMove = moves[scores.max()!]
            return bestMove + 1
        } else {
            let bestMove = moves[scores.min()!]
            return bestMove + 1
        }
    }
}
