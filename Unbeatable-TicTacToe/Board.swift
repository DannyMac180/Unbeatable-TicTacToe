//
//  Board.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import GameplayKit

class Board: NSObject {
    
    var currentPlayer = Player.allPlayers[arc4random() % 2 == 0 ? 0 : 1]
    let emptySpots = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    var spots: [[String]] = [
        ["O", "X", "X"],
        ["X", "O", "O"],
        ["O", "O", "X"]
    ]
    
    subscript(x: Int, y: Int) -> String {
        get {
            return spots[y][x]
        }
        set {
            if spots[y][x] != "X" || spots[y][x] != "O"  {
                spots[y][x] = newValue
            }
        }
    }
    
    var isFull: Bool {
        for row in spots {
            for tile in row {
                if emptySpots.contains(tile) {
                    return false
                }
            }
        }
        return true
    }
    
    var winningPlayer: Player? {
        for column in 0..<spots.count {
            if spots[column][0] == spots[column][1] && spots[column][0] == spots[column][2] {
                if let index = Player.allPlayers.index(where: { player -> Bool in
                    return player.symbol.rawValue == spots[column][0]
                }) {
                    return Player.allPlayers[index]
                } else {
                    return nil
                }
            } else if spots[0][column] == spots[1][column] && spots[0][column] == spots[2][column] {
                if let index = Player.allPlayers.index(where: { player -> Bool in
                    return player.symbol.rawValue == spots[0][column]
                }){
                    return Player.allPlayers[index]
                } else {
                    return nil
                }
            }
        }
        
        if spots[0][0] == spots[1][1] && spots[0][0] == spots[2][2] {
            if let index = Player.allPlayers.index(where: { player -> Bool in
                return player.symbol.rawValue == spots[0][0]
            }){
                return Player.allPlayers[index]
            } else {
                return nil
            }
        } else if spots[2][0] == spots[1][1] && spots[2][0] == spots[0][2] {
            if let index = Player.allPlayers.index(where: { player -> Bool in
                return player.symbol.rawValue == spots[2][0]
            }){
                return Player.allPlayers[index]
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func display() {
        for x in 0..<spots.count {
            print(spots[x][0], spots[x][1], spots[x][2])
        }
    }
    
    func canMove(at position: CGPoint) -> Bool {
        if emptySpots.contains(spots[Int(position.x)][Int(position.y)]) {
            return true
        } else {
            return false
        }
    }
}

extension Board: GKGameModel {
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Board()
        copy.setGameModel(self)
        return copy
    }
    
    var players: [GKGameModelPlayer]? {
        return Player.allPlayers
    }
    
    var activePlayer: GKGameModelPlayer? {
        return currentPlayer
    }
    
    func setGameModel(_ gameModel: GKGameModel) {
        if let board = gameModel as? Board {
            spots = board.spots
        }
    }
    
    func isWin(for player: GKGameModelPlayer) -> Bool {
        guard let player = player as? Player else {
            return false
        }
        
        if let winner = winningPlayer {
            return player == winner
        } else {
            return false
        }
    }
    
    func gameModelUpdates(for player: GKGameModelPlayer) -> [GKGameModelUpdate]? {

        guard let player = player as? Player else {
            return nil
        }
        
        if isWin(for: player) {
            return nil
        }
        
        var moves = [Move]()
        
        for x in 0..<spots.count {
            for y in 0..<spots[x].count {
                let position = CGPoint(x: x, y: y)
                if canMove(at: position) {
                    moves.append(Move(position))
                }
            }
        }
        
        return moves
    }
    
    func apply(_ gameModelUpdate: GKGameModelUpdate) {
        guard  let move = gameModelUpdate as? Move else {
            return
        }

        self[Int(move.coordinate.x), Int(move.coordinate.y)] = currentPlayer.symbol.rawValue
        currentPlayer = currentPlayer.opponent
    }
    
    func score(for player: GKGameModelPlayer) -> Int {
        guard let player = player as? Player else {
            return Move.Score.none.rawValue
        }
        
        if isWin(for: player) {
            return Move.Score.win.rawValue
        } else {
            return Move.Score.none.rawValue
        }
    }
}
