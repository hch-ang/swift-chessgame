//
//  PointLabel.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/27.
//

import UIKit

class PointLabel: UILabel {
    private let point: Point
    
    init(point: Point) {
        self.point = point
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var rank: Int { point.rank }
    var file: Int { point.file }
}
