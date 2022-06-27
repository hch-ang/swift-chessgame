//
//  Knight.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Knight: InitiatiblePiece {
    let team: Team
    var uniCode: String { team == .white ? "♘" : "♞" }
    class var initialFiles: [Int] { [1, 6] }
    class var maxNumberOfPiece: Int { 2 }
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
    
    class func initialRank(team: Team) -> Int {
        return team == .black ? 0 : 7
    }
}
