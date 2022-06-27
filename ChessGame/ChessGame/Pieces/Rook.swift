//
//  Rook.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Rook: BasePiece, Pieceable {
    private let team: Team
    var uniCode: String { team == .white ? "♖" : "♜" }
    override class var initialFiles: [Int] { [0, 7] }
    override class var maxNumberOfPiece: Int { 2 }
    private let possibleMoves: [Point] = {
        var points = [Point]()
        
        for i in 1...7 {
            points.append(Point(rank: -i, file: 0))
            points.append(Point(rank: i, file: 0))
            points.append(Point(rank: 0, file: -i))
            points.append(Point(rank: 0, file: i))
        }

        return points
    }()

    init(team: Team) {
        self.team = team
    }

    func getScore() -> Int {
        return 5
    }

    func movablePointCandidates(from: Point) -> [Point] {
        return possibleMoves.map { $0 + from }
    }
    
    override class func initialRank(team: Team) -> Int {
        return team == .black ? 0 : 7
    }
}
