//
//  ChessGameRuleManagerTest.swift
//  ChessGameTests
//
//  Created by Hochang Lee on 2022/06/25.
//

import XCTest
@testable import ChessGame

class ChessGameRuleManagerTest: XCTestCase {

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

    func testRuleManagerChecksPieceRangeWell() throws {
        let boardStub = Board()
        let rankRange = boardStub.boardRankRange
        let fileRange = boardStub.boardFileRange

        let ruleManager = RuleManager(board: boardStub)
        
        // both valid
        for i in 0..<rankRange {
            for j in 0..<fileRange {
                XCTAssertTrue(ruleManager.checkPieceRange(point: Point(rank: i, file: j)))
            }
        }
        
        // both invalid
        for i in -100..<0 {
            for j in -100..<0 {
                XCTAssertFalse(ruleManager.checkPieceRange(point: Point(rank: i, file: j)))
            }
        }
        
        for i in rankRange+1...rankRange+100 {
            for j in fileRange+1...fileRange+100 {
                XCTAssertFalse(ruleManager.checkPieceRange(point: Point(rank: i, file: j)))
            }
        }
        
        // only rank valid
        for i in 0..<rankRange {
            for j in -100..<0 {
                XCTAssertFalse(ruleManager.checkPieceRange(point: Point(rank: i, file: j)))
            }
        }
        
        for i in 0..<rankRange {
            for j in fileRange+1..<fileRange+100 {
                XCTAssertFalse(ruleManager.checkPieceRange(point: Point(rank: i, file: j)))
            }
        }

        // only file valid
        for i in -100..<0 {
            for j in 0..<fileRange {
                XCTAssertFalse(ruleManager.checkPieceRange(point: Point(rank: i, file: j)))
            }
        }

        for i in rankRange+1..<rankRange+100 {
            for j in 0..<fileRange {
                XCTAssertFalse(ruleManager.checkPieceRange(point: Point(rank: i, file: j)))
            }
        }
    }
}
