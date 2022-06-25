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

protocol Pieceable {
    var uniCode: String { get }
    func getScore() -> Int
}

class BasePiece: Pieceable {
    var uniCode: String { "" }
    
    func getScore() -> Int { return 0 }
}
