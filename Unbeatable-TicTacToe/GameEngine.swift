//
//  GameEngine.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/30/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import GameplayKit

struct GameEngine {
    
    private let minmaxStrategist: GKMinmaxStrategist = {
        let strategist = GKMinmaxStrategist()
        
        strategist.maxLookAheadDepth = 9
        strategist.randomSource = GKARC4RandomSource()
        
        return strategist
    }()
    
    var board: Board {
        didSet {
            minmaxStrategist.gameModel = board
        }
    }
    
    var bestCoordinate: CGPoint? {
        if let move = minmaxStrategist.bestMove(for: board.currentPlayer) as? Move {
            return move.coordinate
        }
        
        return nil
    }
}

