//
//  ChessGamePieceInitializeTests.swift
//  ChessGameTests
//
//  Created by Hochang Lee on 2022/06/25.
//

import XCTest
@testable import ChessGame

class ChessGamePieceInitializeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    // MARK: - Pawn
    
    func testBlackPawnInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 1, file: 0),
                                       Point(rank: 1, file: 1),
                                       Point(rank: 1, file: 2),
                                       Point(rank: 1, file: 3),
                                       Point(rank: 1, file: 4),
                                       Point(rank: 1, file: 5),
                                       Point(rank: 1, file: 6),
                                       Point(rank: 1, file: 7)]
        for i in 0..<10 {
            let initialPoints = Pawn.initialPoints(team: .black, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testBlackPawnInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Pawn.initialPoints(team: .black, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Pawn.maxNumberOfPiece)
        }
    }
    
    func testWhitePawnInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 6, file: 0),
                                       Point(rank: 6, file: 1),
                                       Point(rank: 6, file: 2),
                                       Point(rank: 6, file: 3),
                                       Point(rank: 6, file: 4),
                                       Point(rank: 6, file: 5),
                                       Point(rank: 6, file: 6),
                                       Point(rank: 6, file: 7)]
        for i in 0..<10 {
            let initialPoints = Pawn.initialPoints(team: .white, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testWhitePawnInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Pawn.initialPoints(team: .white, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Pawn.maxNumberOfPiece)
        }
    }
    
    // MARK: - Bishop
    
    func testBlackBishopInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 0, file: 2),
                                       Point(rank: 0, file: 5)]
        for i in 0..<10 {
            let initialPoints = Bishop.initialPoints(team: .black, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testBlackBishopInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Bishop.initialPoints(team: .black, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Bishop.maxNumberOfPiece)
        }
    }
    
    func testWhiteBishopInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 7, file: 2),
                                       Point(rank: 7, file: 5)]
        for i in 0..<10 {
            let initialPoints = Bishop.initialPoints(team: .white, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testWhiteBishopInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Bishop.initialPoints(team: .white, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Bishop.maxNumberOfPiece)
        }
    }

    // MARK: - Rook
    
    func testBlackRookInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 0, file: 0),
                                       Point(rank: 0, file: 7)]
        for i in 0..<10 {
            let initialPoints = Rook.initialPoints(team: .black, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testBlackRookInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Rook.initialPoints(team: .black, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Rook.maxNumberOfPiece)
        }
    }
    
    func testWhiteRookInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 7, file: 0),
                                       Point(rank: 7, file: 7)]
        for i in 0..<10 {
            let initialPoints = Rook.initialPoints(team: .white, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testWhiteRookInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Rook.initialPoints(team: .white, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Rook.maxNumberOfPiece)
        }
    }
    
    // MARK: - Queen
    
    func testBlackQueenInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 0, file: 4)]
        for i in 0..<10 {
            let initialPoints = Queen.initialPoints(team: .black, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testBlackQueenInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Queen.initialPoints(team: .black, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Queen.maxNumberOfPiece)
        }
    }
    
    func testWhiteQueenInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 7, file: 4)]
        for i in 0..<10 {
            let initialPoints = Queen.initialPoints(team: .white, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testWhiteQueenInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Queen.initialPoints(team: .white, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Queen.maxNumberOfPiece)
        }
    }

    // MARK: - Knight
    
    func testBlackKnightInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 0, file: 1),
                                       Point(rank: 0, file: 6)]
        for i in 0..<10 {
            let initialPoints = Knight.initialPoints(team: .black, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testBlackKnightInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Knight.initialPoints(team: .black, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Knight.maxNumberOfPiece)
        }
    }
    
    func testWhiteKnightkInitialPointsAreValid() throws {
        let possiblePoints: [Point] = [Point(rank: 7, file: 1),
                                       Point(rank: 7, file: 6)]
        for i in 0..<10 {
            let initialPoints = Knight.initialPoints(team: .white, i)
            for point in initialPoints {
                XCTAssertTrue(possiblePoints.contains(point))
            }
        }
    }
    
    func testWhiteKnightInitializedValidCount() throws {
        for i in 0..<100 {
            let initialPoints = Knight.initialPoints(team: .white, i)
            XCTAssertLessThanOrEqual(initialPoints.count, Knight.maxNumberOfPiece)
        }
    }
}
