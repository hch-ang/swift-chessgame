//
//  Knight.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Knight: BasePiece, Pieceable {
    private let team: Team
    var uniCode: String { team == .white ? "♘" : "♞" }
    override class var initialFiles: [Int] { [1, 6] }
    override class var maxNumberOfPiece: Int { 2 }
    private let possibleMoves: [Point] = {
        var points = [Point]()
        
        points.append(Point(rank: -2, file: -1))
        points.append(Point(rank: -2, file: 1))
        points.append(Point(rank: 2, file: -1))
        points.append(Point(rank: 2, file: 1))
        points.append(Point(rank: -1, file: -2))
        points.append(Point(rank: 1, file: -2))
        points.append(Point(rank: -1, file: 2))
        points.append(Point(rank: 1, file: 2))

        return points
    }()

    init(team: Team) {
        self.team = team
    }

    func getScore() -> Int {
        return 3
    }

    func movablePointCandidates(from: Point) -> [Point] {
        return possibleMoves.map { $0 + from }
    }
    
    override class func initialRank(team: Team) -> Int {
        return team == .black ? 0 : 7
    }
}
