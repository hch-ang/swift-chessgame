//
//  Board.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation

final class Board {
    let boardRankRange = 8
    let boardFileRange = 8
    var map: [[Pieceable]] = []

    lazy private var ruleManeger: RuleManager = {
        return RuleManager(board: self)
    }()
    
    func startGame() {
        
    }
    
    func move(from: Point, to: Point) {
        guard ruleManeger.checkPieceRange(point: from), ruleManeger.checkPieceRange(point: to) else { return }
        
    }
}
