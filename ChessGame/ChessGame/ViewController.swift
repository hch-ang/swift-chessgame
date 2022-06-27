//
//  ViewController.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let board = Board()
        board.startGame()
    }


}

