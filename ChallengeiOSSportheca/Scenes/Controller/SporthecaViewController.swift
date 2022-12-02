//
//  SporthecaViewController.swift
//  ChallengeiOSSportheca
//
//  Created by Ezequias Santos on 01/12/22.
//

import UIKit

class SporthecaViewController: UIViewController {
    
    // MARK: - Properties
    lazy var sporthecaView: SporthecaView = {
        let view = SporthecaView()
        view.isHidden = true
        return view
    }()
    
    private var viewModel: SporthecaModelProtocol
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinding()
    }
    
    init(viewModel: SporthecaModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBinding() {
        viewModel.sporthecaObject.bind { [weak self] sportheca in
            guard let self = self else {return}
            if sportheca == nil {
                self.sporthecaView.isHidden = true
            } else {
                self.sporthecaView.isHidden = false
                if let player = sportheca?.player {
                    self.sporthecaView.userImage.kf.setImage(with: URL(string: player.img ?? ""))
                    self.sporthecaView.userNameLabel.text = player.name
                    self.sporthecaView.positionLabel.text = player.pos
                    self.sporthecaView.countryLabel.text = player.country
                    if let percentual = player.percentual {
                        let valuePercentualString = String(format: "%.3f", percentual)
                        self.sporthecaView.percentualLabel.text = valuePercentualString
                    }
                    self.sporthecaView.winsProgressView.progress = Float(player.barras?.worldCupsWins?.pla ?? 0) / Float(player.barras?.worldCupsWins?.max ?? 0)
                    self.sporthecaView.disputedProgressView.progress = Float(player.barras?.worldCupsPlayed?.pla ?? 0) / Float(player.barras?.worldCupsPlayed?.max ?? 0)
                    self.sporthecaView.scoreboardWinsLabel.text = String(Double(player.barras?.worldCupsWins?.pla ?? 0))
                    self.sporthecaView.scoreboardDisputedLabel.text = String(Double(player.barras?.worldCupsPlayed?.pla ?? 0))
                    if let positionWin = player.barras?.worldCupsWins?.pos {
                        self.sporthecaView.positionWinsLabel.text = "\(positionWin)º"
                    }
                    if let positionPlayed = player.barras?.worldCupsPlayed?.pos {
                        self.sporthecaView.positionDisputedLabel.text = "\(positionPlayed)º"
                    }
                }
            }
        }
    }
}

// MARK: - CodeView
extension SporthecaViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(sporthecaView)
    }
    
    func setupConstraints() {
        sporthecaView.anchor(
            top: view.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}
