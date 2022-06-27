//
//  Board.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation
import Combine

final class Board {
    let boardRankRange = 8
    let boardFileRange = 8
    @Published var map: [[Pieceable?]] = []

    lazy private var ruleManeger: RuleManager = {
        return RuleManager(board: self)
    }()
    
    func startGame() {
        resetBoard()
        setPieces()
        
        showBoard()
    }
    
    private func resetBoard() {
        map = [[Pieceable?]](repeating: [Pieceable?](repeating: nil, count: boardFileRange), count: boardRankRange)
    }
    
    private func setPieces() {
        for team in Team.allCases {
            _ = Pawn.initialPoints(team: team, 8).map { map[$0.rank][$0.file] = Pawn(team: team) }
            _ = Bishop.initialPoints(team: team, 2).map { map[$0.rank][$0.file] = Bishop(team: team) }
            _ = Rook.initialPoints(team: team, 2).map { map[$0.rank][$0.file] = Rook(team: team) }
            _ = Queen.initialPoints(team: team, 1).map { map[$0.rank][$0.file] = Queen(team: team) }
            _ = Knight.initialPoints(team: team, 2).map { map[$0.rank][$0.file] = Knight(team: team) }
        }
    }
    
    func showBoard() {
        print(" ABCDEFGH")
        for i in 0..<boardRankRange {
            print(makeRankString(rank: i))
        }
        print(" ABCDEFGH")
    }
    
    private func makeRankString(rank: Int) -> String {
        var string = "\(rank+1)"
        for j in 0..<boardFileRange {
            string += map[rank][j]?.uniCode ?? "."
        }
        return string
    }
    
    func printScore() {
        
    }
    
    func checkScore(_ team: Team) -> Int {
        return 0
    }
    
    func move(from: Point, to: Point) {
        guard ruleManeger.checkPieceRange(point: from), ruleManeger.checkPieceRange(point: to) else { return }
        
    }
    
    // MARK: - input
    
    func selectPoint(point: Point) {
        print("select Point : \(point)")
    }
    
    // MARK: - Display

    func getCode(_ point: Point) -> String? {
        guard ruleManeger.checkPieceRange(point: point),
              let pieceable = map[point.rank][point.file]
        else { return nil }
        
        return pieceable.uniCode
    }
}
