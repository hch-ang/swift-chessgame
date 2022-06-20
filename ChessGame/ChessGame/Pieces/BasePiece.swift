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
    var team: Team { get } // 팀
    var type: PieceType { get } // 타입
    var point: Point { get set } // 위치
}
