//
//  Utility.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation

class UtilityManager {
    static func convertRankToIndex(rank: String) -> Int {
        switch rank {
        case "A":
            return 0
        case "B":
            return 1
        case "C":
            return 2
        case "D":
            return 3
        case "E":
            return 4
        case "F":
            return 5
        case "G":
            return 6
        case "H":
            return 7
        default:
            return -1
        }
    }
}
