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
    func getScore() -> Int
    func movablePoints(_ maxRank: Int, _ maxFile: Int) -> [Point]
    
    static func initialPoints(team: Team, _ numberOfPieces: Int) -> [Point]
}

class BasePiece {
    class var initialFiles: [Int] { [] }
    class var maxNumberOfPiece: Int { 0 }

    class func initialRank(team: Team) -> Int { return 0 }

    static func initialPoints(team: Team, _ numberOfPieces: Int) -> [Point] {
        guard numberOfPieces <= maxNumberOfPiece else { return [] }
        
        let randomNumbers = RandomGenerator.generate(numberOfResult: numberOfPieces, maxValue: initialFiles.count - 1)
        return randomNumbers.map { Point(rank: initialRank(team: team), file: initialFiles[$0]) }
    }
}
