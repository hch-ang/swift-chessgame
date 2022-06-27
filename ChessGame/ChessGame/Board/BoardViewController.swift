//
//  BoardViewController.swift
//  ChessGame
//
//  Created by Hochang Lee on 2022/06/27.
//

import UIKit
import Combine

class BoardViewController: UIViewController {
    @IBOutlet weak var bodyView: UIView!
    
    private let board = Board()
    private var cancellables = Set<AnyCancellable>()
    private var pointLabels: [[PointLabel]] = Array(repeating: [], count: 8)
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addBoardObserver()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        board.startGame()
    }

    // MARK: - Observer
    
    private func addBoardObserver() {
        board.$map
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.refreshView()
            }.store(in: &cancellables)
    }
    
    // MARK: - configure
    
    private func configureUI() {
        configureBodyViewUI()
        configureStackView()
    }
    
    private func configureBodyViewUI() {
        bodyView.layer.borderWidth = 2
    }
    
    private func configureStackView() {
        let rankStackView = UIStackView()
        rankStackView.axis = .vertical
        rankStackView.distribution = .fillEqually

        bodyView.addSubview(rankStackView)
        rankStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rankStackView.topAnchor.constraint(equalTo: bodyView.topAnchor),
            rankStackView.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor),
            rankStackView.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor),
            rankStackView.bottomAnchor.constraint(equalTo: bodyView.bottomAnchor)
        ])

        for i in 0..<8 {
            let fileStackView = UIStackView()
            fileStackView.axis = .horizontal
            fileStackView.distribution = .fillEqually
            
            for j in 0..<8 {
                let label = PointLabel(point: Point(rank: i, file: j))
                label.textAlignment = .center
                label.layer.borderWidth = 1
                label.textColor = .black
                label.text = "."
                label.isUserInteractionEnabled = true
                
                fileStackView.addArrangedSubview(label)
                pointLabels[i].append(label)

                let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTouchBoard(_:)))
                label.addGestureRecognizer(recognizer)
            }
            
            rankStackView.addArrangedSubview(fileStackView)
        }
    }
    
    // MARK: - Input
    
    @objc
    private func didTouchBoard(_ sender: UIGestureRecognizer) {
        guard let pointLabel = sender.view as? PointLabel else { return }

        let rank = pointLabel.rank
        let file = pointLabel.file
        
        board.selectPoint(point: Point(rank: rank, file: file))
    }

    // MARK: - Display
    
    private func refreshView() {
        for i in 0..<8 {
            for j in 0..<8 {
                let point = Point(rank: i, file: j)
                pointLabels[i][j].text = board.getCode(point)
            }
        }
    }
}
