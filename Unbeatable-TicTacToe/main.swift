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
var humanPlayer = Player()
var computerPlayer = Player()


computerPlayer.symbol = "X"
let move = gameEngine.miniMax(board, computerPlayer.playerIsComputer, computerPlayer.symbol)





