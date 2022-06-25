//
//  Queen.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Queen: BasePiece {
    private let team: Team
    private let type: PieceType = .queen
    override var uniCode: String { team == .white ? "♕" : "♛" }
    
    init(team: Team) {
        self.team = team
    }

    override func getScore() -> Int {
        return type.scorePoint
    }
}
