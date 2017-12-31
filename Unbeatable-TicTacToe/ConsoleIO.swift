//
//  ConsoleIO.swift
//  Unbeatable-TicTacToe
//
//  Created by Daniel McAteer on 12/31/17.
//  Copyright © 2017 Daniel McAteer. All rights reserved.
//

import Foundation

class ConsoleIO {
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let stringData = String(data: inputData, encoding: String.Encoding.utf8)!
        return stringData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
