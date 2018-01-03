//
//  GameEngine.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/30/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

struct GameEngine {
    
    func getHumanMove(player: Player) -> Int {
        print("\(player.name), you're turn. Please enter the open space number where you want to place your next move:")
        let input = Int(console.getInput())!
        return input
    }
    
    func makeMove(_ board: Board, _ move: Int, _ player: Player) -> Board {
        var newBoard = board
        newBoard.spots[move - 1] = player.symbol // move - 1 so it writes to the proper index of the move chosen
        return newBoard
    }
    
    func score(_ board: Board, _ player: Player) -> Int {
        
        if board.isWinningState(board: board, player: player) {
            return 10
        } else if board.availableSpots().count == 0 {
            return 0
        } else {
            return -10
        }
    }
    
    func getComputerBestMove(_ board: Board, _ player: Player) -> Int {
        if board.availableSpots().count == 0 {
            return score(board, player)
        }
        
        var scores: [Int] = []
        var moves: [Int] = []
        
        let availableSpots = board.availableSpots()
        
        for spot in 0..<availableSpots.count {
            var nextBoard = board.copy()
            
            nextBoard = makeMove(board, spot, player)
            scores.append(getComputerBestMove(nextBoard, player))
            nextBoard.spots[spot] = board.spots[spot]
            moves.append(spot)
        }
        
        let index = scores.index(of: scores.max()!)!
        return moves[index] + 1
    }
}
