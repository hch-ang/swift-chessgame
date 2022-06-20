//
//  RuleManager.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation

final class RuleManager {
    private let board: Board
    
    init(board: Board) {
        self.board = board
    }
    
    func checkPieceRange(point: Point) -> Bool {
        let row = point.file
        let column = UtilityManager.convertRankToIndex(rank: point.rank)

        if checkRange(index: row) && checkRange(index: column) {
            return true
        }
        
        return false
    }
    
    private func checkRange(index: Int) -> Bool {
        guard index >= 0, index < board.boardFileRange else { return false }

        return true
    }
}
