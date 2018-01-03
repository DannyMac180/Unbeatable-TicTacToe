//
//  main.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

let console = ConsoleIO()
let gameEngine = GameEngine()
var board = Board()
var gameType = GameType.getGameType()
var player1 = Player()
var player2 = Player()
var playerHasNextMove = player1

player1.symbol = "X"

board.outputBoard()
let nextMove = gameEngine.getHumanMove(player: playerHasNextMove)
board = gameEngine.makeMove(board, nextMove, player1)
board.outputBoard()
let openSpots = board.availableSpots()
print(openSpots)

