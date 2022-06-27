//
//  Queen.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Queen: BasePiece, Pieceable {
    private let team: Team
    var uniCode: String { team == .white ? "♕" : "♛" }
    override class var initialFiles: [Int] { [4] }
    override class var maxNumberOfPiece: Int { 1 }

    init(team: Team) {
        self.team = team
    }

    func getScore() -> Int {
        return 9
    }

    func movablePoints(_ maxRank: Int, _ maxFile: Int) -> [Point] {
        return []
    }
    
    override class func initialRank(team: Team) -> Int {
        return team == .black ? 0 : 7
    }
}
