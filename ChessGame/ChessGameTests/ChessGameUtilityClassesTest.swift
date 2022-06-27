//
//  ChessGameUtilityClassesTest.swift
//  ChessGameTests
//
//  Created by Hochang Lee on 2022/06/25.
//

import XCTest
@testable import ChessGame

class ChessGameUtilityClassesTest: XCTestCase {

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

    func testRandomGeneratorGeneratesValidCount() {
        for i in 0..<100 {
            let numbers = RandomGenerator.generate(numberOfResult: i, maxValue: 100000)
            XCTAssertEqual(numbers.count, i)
        }
    }
    
    func testRandomGeneratorGeneratesValidRangeOfNumbers() {
        for i in 1000..<1000 {
            let numbers = RandomGenerator.generate(numberOfResult: 100, maxValue: i)
            for number in numbers {
                XCTAssertGreaterThanOrEqual(number, 0)
                XCTAssertLessThanOrEqual(number, i)
            }
        }
    }
    
    func testRandomGeneratorGeneratesDistinctNumbers() {
        for i in 0..<100 {
            let numbers = RandomGenerator.generate(numberOfResult: i, maxValue: 10000)
            for number in numbers {
                XCTAssertEqual(numbers.filter { $0 == number}.count, 1)
            }
        }
    }
}
