//
//  RuleManager.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation

final class RuleManager {
    private unowned let board: Board
    
    init(board: Board) {
        self.board = board
    }
    
    func checkPieceRange(point: Point) -> Bool {
        let row = point.file
        let column = point.rank

        if checkRankRange(index: row) && checkFileRange(index: column) {
            return true
        }
        
        return false
    }
    
    private func checkRankRange(index: Int) -> Bool {
        guard index >= 0, index < board.boardRankRange else { return false }

        return true
    }

    private func checkFileRange(index: Int) -> Bool {
        guard index >= 0, index < board.boardFileRange else { return false }

        return true
    }
}
