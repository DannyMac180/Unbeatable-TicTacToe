//
//  main.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

var board = Board()

var player1 = Player()
var player2 = Player()

board = Board.makeMove(board: board, space: "2", withSymbol: "X")
board = Board.makeMove(board: board, space: "7", withSymbol: "X")
board = Board.makeMove(board: board, space: "9", withSymbol: "O")
print(board.outputBoard())



