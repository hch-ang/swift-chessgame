//
//  Knight.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Knight: BasePiece {
    private let team: Team
    override var uniCode: String { team == .white ? "♘" : "♞" }
    
    init(team: Team) {
        self.team = team
    }

    override func getScore() -> Int {
        return 3
    }
}
