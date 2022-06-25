//
//  BasePiece.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation

enum Team {
    case black, white
}

enum PieceType {
    case pawn, bishop, luke, queen, knight, king
    
    var scorePoint: Int {
        switch self {
        case .pawn:
            return 1
        case .bishop:
            return 3
        case .luke:
            return 5
        case .queen:
            return 9
        case .knight:
            return 3
        case .king:
            return 0
        }
    }
}

protocol Pieceable {
    var uniCode: String { get }
    func getScore() -> Int
}

class BasePiece: Pieceable {
    var uniCode: String { "" }
    
    func getScore() -> Int { return 0 }
}
