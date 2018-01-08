//
//  Board.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import GameplayKit

class Board: NSObject {
    
    var currentPlayer: Player
    
    init(_ currentPlayer: Player) {
        self.currentPlayer = currentPlayer
    }
    
    fileprivate var spots: [[Player.Symbol]] = [
        [.empty, .empty, .empty],
        [.empty, .empty, .empty],
        [.empty, .empty, .empty]
    ]
    
    subscript(x: Int, y: Int) -> Player.Symbol {
        get {
            return spots[y][x]
        }
        set {
            if spots[y][x] == .empty {
                spots[y][x] = newValue
            }
        }
    }
    
    var isFull: Bool {
        for row in spots {
            for tile in row {
                if tile == .empty {
                    return false
                }
            }
        }
        return true
    }
    
    var winningPlayer: Player? {
        for column in 0..<spots.count {
            if spots[column][0] == spots[column][1] && spots[column][0] == spots[column][2] && spots[column][0] != .empty {
                if let index = Player.allPlayers.index(where: { player -> Bool in
                    return player.symbol == spots[column][0]
                }) {
                    return Player.allPlayers[index]
                } else {
                    return nil
                }
            } else if spots[0][column] == spots[1][column] && spots[0][column] == spots[2][column] && spots[0][column] != .empty {
                if let index = Player.allPlayers.index(where: { player -> Bool in
                    return player.symbol == spots[0][column]
                }){
                    return Player.allPlayers[index]
                } else {
                    return nil
                }
            }
        }
        
        if spots[0][0] == spots[1][1] && spots[0][0] == spots[2][2] && spots[0][0] != .empty {
            if let index = Player.allPlayers.index(where: { player -> Bool in
                return player.symbol == spots[0][0]
            }){
                return Player.allPlayers[index]
            } else {
                return nil
            }
        } else if spots[2][0] == spots[1][1] && spots[2][0] == spots[0][2] && spots[0][2] != .empty {
            if let index = Player.allPlayers.index(where: { player -> Bool in
                return player.symbol == spots[2][0]
            }){
                return Player.allPlayers[index]
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func clear() {
        for x in 0..<spots.count {
            for y in 0..<spots[x].count {
                self[x, y] = .empty
            }
        }
    }
    
    func canMove(at position: CGPoint) -> Bool {
        if self[Int(position.x), Int(position.y)] == .empty {
            return true
        } else {
            return false
        }
    }
}
