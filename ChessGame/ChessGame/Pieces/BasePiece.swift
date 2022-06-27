//
//  BasePiece.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation

enum Team: CaseIterable {
    case black, white
}

protocol Pieceable {
    var uniCode: String { get }
    var team: Team { get }
    func getScore() -> Int
    func movablePointCandidates(from: Point) -> [Point]
    
    static func initialPoints(team: Team, _ numberOfPieces: Int) -> [Point]
}

protocol InitiatiblePiece: Pieceable {
    static var initialFiles: [Int] { get }
    static var maxNumberOfPiece: Int { get }
    static func initialRank(team: Team) -> Int
}

extension InitiatiblePiece {
    static func initialPoints(team: Team, _ numberOfPieces: Int) -> [Point] {
        guard numberOfPieces <= maxNumberOfPiece else { return [] }
        
        let randomNumbers = RandomGenerator.generate(numberOfResult: numberOfPieces, maxValue: initialFiles.count - 1)
        return randomNumbers.map { Point(rank: initialRank(team: team), file: initialFiles[$0]) }
    }
}
