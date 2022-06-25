//
//  Bishop.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Bishop: BasePiece, Pieceable {
    private let team: Team
    var uniCode: String { team == .white ? "♗" : "♝" }
    override class var initialFiles: [Int] { [2, 5] }
    override class var maxNumberOfPiece: Int { 2 }

    init(team: Team) {
        self.team = team
    }

    func getScore() -> Int {
        return 3
    }

    func movablePoints(_ maxRank: Int, _ maxFile: Int) -> [Point] {
        return []
    }
    
    override class func initialRank(team: Team) -> Int {
        return team == .black ? 0 : 7
    }
}
