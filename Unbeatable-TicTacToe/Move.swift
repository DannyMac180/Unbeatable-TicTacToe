//
//  Move.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 1/8/18.
//  Copyright © 2018 Daniel McAteer. All rights reserved.
//

import GameplayKit

class Move: NSObject, GKGameModelUpdate {
    
    enum Score: Int {
        case none
        case win
    }
    
    var value: Int = 0
    var coordinate: CGPoint
    
    init(_ coordinate: CGPoint) {
        self.coordinate = coordinate
    }
}
