//
//  Pawn.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Pawn: BasePiece, Pieceable {
    private let team: Team
    var uniCode: String { team == .white ? "♙" : "♟" }
    override class var initialFiles: [Int] { [0, 1, 2, 3, 4, 5, 6, 7] }
    override class var maxNumberOfPiece: Int { 8 }
    
    init(team: Team) {
        self.team = team
    }

    func getScore() -> Int {
        return 1
    }

    func movablePoints(_ maxRank: Int, _ maxFile: Int) -> [Point] {
        return []
    }
    
    override class func initialRank(team: Team) -> Int {
        return team == .black ? 1 : 6
    }
}
