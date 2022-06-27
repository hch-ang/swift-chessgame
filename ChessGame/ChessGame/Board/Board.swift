//
//  Board.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation
import Combine

enum GameStatus {
    case selectFirst
    case selectSecond
}

final class Board {
    struct SelectInfo {
        let selectedPoint: Point
        let possiblePoints: [Point]
    }
    
    let boardRankRange = 8
    let boardFileRange = 8
    
    @Published var map: [[Pieceable?]] = []
    @Published var guideMessage: String?
    @Published var statusMessage: String?
    @Published var turn: Team = .black
    @Published var selectInfo: SelectInfo?
    
    private var status: GameStatus = .selectFirst

    lazy private var ruleManeger: RuleManager = {
        return RuleManager(board: self)
    }()
    
    func startGame() {
        resetBoard()
        setPieces()
        
        // display
        didStartGame()
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
    
    private func didStartGame() {
        // for UI
        setStatusMessage("게임이 초기화 되었습니다")
        setGuideMessage("체스말을 골라주세요")
        
        // for Debug
        showBoard()
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
        guard ruleManeger.checkPieceRange(point: point) else { return }
        
        switch status {
        case .selectFirst:
            selectFirstPiece(point: point)
        case .selectSecond:
            selectSecondPiece(point: point)
        }
    }
    
    private func selectFirstPiece(point: Point) {
        guard ruleManeger.checkPieceRange(point: point),
              let pieceable = map[point.rank][point.file]
        else { return }
        
        let possiblePoints = ruleManeger.filterCandidates(team: pieceable.team, candidates: pieceable.movablePointCandidates(from: point))
        
        guard possiblePoints.count > 0 else {
            setGuideMessage("해당 말은 이동 가능한 경로가 없습니다")
            print("해당 말은 이동 가능한 경로가 없습니다")
            return
        }
        
        selectInfo = SelectInfo(selectedPoint: point, possiblePoints: possiblePoints)
        for point in possiblePoints {
            print(point)
        }
        
        setGuideMessage("이동하실 위치를 골라주세요")
        setStatusMessage(nil)
        
    }
    
    private func selectSecondPiece(point: Point) {
        guard ruleManeger.checkPieceRange(point: point),
              let pieceable = map[point.rank][point.file]
        else { return }

    }
    
    // MARK: - Display

    func getCode(_ point: Point) -> String? {
        guard ruleManeger.checkPieceRange(point: point),
              let pieceable = map[point.rank][point.file]
        else { return nil }
        
        return pieceable.uniCode
    }
    
    private func setGuideMessage(_ message: String?) {
        guideMessage = message
    }
    
    private func setStatusMessage(_ message: String?) {
        statusMessage = message
    }
}
