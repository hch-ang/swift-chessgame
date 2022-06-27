//
//  Utility.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import Foundation

final class RandomGenerator {
    static func generate(numberOfResult: Int, maxValue: Int) -> [Int] {
        var numbers = [Int]()
        for _ in 0..<numberOfResult {
            var flag = false
            while !flag {
                let num = Int.random(in: 0...maxValue)
                if numbers.contains(num) {
                    continue
                } else {
                    numbers.append(num)
                    flag = true
                }
            }
        }
        return numbers
    }
}
