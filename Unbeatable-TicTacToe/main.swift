//
//  main.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/29/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

let console = ConsoleIO()
var board = Board()
var gameType = GameType.getGameType()
var player1 = Player()
var player2 = Player()

player1.name = player1.getPlayerName(playerNumber: 1)
player1.symbol = player1.getPlayerSymbol(player1)
print(player1.symbol)
player2.symbol = player2.assignOppositeSymbol()
print(player2.symbol)
player1.assignFirstMove()
