//
//  Pawn.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/23.
//

import Foundation

final class Pawn: InitiatiblePiece {
    private let team: Team
    var uniCode: String { team == .white ? "♙" : "♟" }
    private lazy var possibleMoves: [Point] = {
        var points = [Point]()
        
        for i in 1...7 {
            switch team {
            case .black:
                points.append(Point(rank: i, file: 0))
            case .white:
                points.append(Point(rank: -i, file: 0))
            }
            points.append(Point(rank: 0, file: -i))
            points.append(Point(rank: 0, file: i))
        }

        return points
    }()

    class var initialFiles: [Int] { [0, 1, 2, 3, 4, 5, 6, 7] }
    class var maxNumberOfPiece: Int { 8 }
    
    init(team: Team) {
        self.team = team
    }

    func getScore() -> Int {
        return 1
    }

    func movablePointCandidates(from: Point) -> [Point] {
        return possibleMoves.map { $0 + from }
    }
    
    class func initialRank(team: Team) -> Int {
        return team == .black ? 1 : 6
    }
}
