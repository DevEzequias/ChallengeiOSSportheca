//
//  SporthecaView.swift
//  ChallengeiOSSportheca
//
//  Created by Ezequias Santos on 01/12/22.
//

import UIKit
import Kingfisher

final class SporthecaView: UIView {
    
    // MARK: - Properties
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "ic_background")
        image.clipsToBounds = true
        return image
    }()
    
    lazy var userView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "ic_user_image")
        image.clipsToBounds = true
        image.setDimensions(width: 100, height: 100)
        image.layer.cornerRadius = 100 / 2
        image.backgroundColor = .white
        return image
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Usuário de Teste"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Alemanha"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.text = "Atacante"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var userStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [userNameLabel, countryLabel, positionLabel])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    lazy var percentualLabel: UILabel = {
        let label = UILabel()
        label.text = "59.193"
        label.textColor = .purple
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.clipsToBounds = true
        label.setDimensions(width: 70, height: 70)
        label.layer.cornerRadius = 70 / 2
        label.backgroundColor = .systemGray2
        return label
    }()
    
    lazy var winsLabel: UILabel = {
        let label = UILabel()
        label.text = "Copas do Mundo Vencidas"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var winsProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.0
        progressView.progressTintColor = .purple
        progressView.layer.borderWidth = 1
        progressView.layer.borderColor = UIColor.white.cgColor
        progressView.trackTintColor = .clear
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.setDimensions(width: UIScreen.main.bounds.width * 0.7, height: 20)
        return progressView
    }()
    
    lazy var positionWinsLabel: UILabel = {
        let label = UILabel()
        label.text = "18º"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var scoreboardWinsLabel: UILabel = {
        let label = UILabel()
        label.text = "1.0"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var disputedLabel: UILabel = {
        let label = UILabel()
        label.text = "Copas do Mundo Disputadas"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var disputedProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        progressView.progressTintColor = .purple
        progressView.layer.borderWidth = 1
        progressView.layer.borderColor = UIColor.white.cgColor
        progressView.trackTintColor = .clear
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.setDimensions(width: UIScreen.main.bounds.width * 0.7, height: 20)
        return progressView
    }()
    
    lazy var positionDisputedLabel: UILabel = {
        let label = UILabel()
        label.text = "2º"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var scoreboardDisputedLabel: UILabel = {
        let label = UILabel()
        label.text = "4.0"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        return label
    }()
    
    private var userContainerStack = UIStackView()
    private var userDataStack = UIStackView()
    private var winsStack = UIStackView()
    private var winsContainerStack = UIStackView()
    private var disputedStack = UIStackView()
    private var disputedContainerStack = UIStackView()
    private var progressContainerStack = UIStackView()
    private var containerStack = UIStackView()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeView
extension SporthecaView: CodeView {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        
        userDataStack = UIStackView(arrangedSubviews: [userNameLabel, countryLabel, positionLabel])
        userDataStack.axis = .vertical
        userDataStack.distribution = .fill
        userDataStack.spacing = 10
        
        userContainerStack = UIStackView(arrangedSubviews: [userView])
        userContainerStack.distribution = .fill
        
        userView.addSubview(userImage)
        userView.addSubview(userDataStack)
        userView.addSubview(percentualLabel)
        
        winsStack = UIStackView(arrangedSubviews: [winsProgressView, positionWinsLabel])
        winsStack.axis = .horizontal
        winsStack.distribution = .fill
        winsStack.spacing = 4
        
        disputedStack = UIStackView(arrangedSubviews: [disputedProgressView, positionDisputedLabel])
        disputedStack.axis = .horizontal
        disputedStack.distribution = .fill
        disputedStack.spacing = 4
        
        containerStack = UIStackView(arrangedSubviews: [userContainerStack])
        containerStack.axis = .vertical
        containerStack.distribution = .fill
        containerStack.spacing = 40
        
        backgroundImage.addSubview(containerStack)
        backgroundImage.addSubview(winsLabel)
        backgroundImage.addSubview(winsStack)
        backgroundImage.addSubview(disputedLabel)
        backgroundImage.addSubview(disputedStack)
        backgroundImage.addSubview(scoreboardWinsLabel)
        backgroundImage.addSubview(scoreboardDisputedLabel)
    }
    
    func setupConstraints() {
        backgroundImage.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor
        )
        
        userImage.centerX(inView: userView.self)
        userImage.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            paddingTop: 25
        )

        userDataStack.centerX(inView: userView.self)
        userDataStack.anchor(
            top: userImage.bottomAnchor,
            paddingTop: 20
        )
        
        percentualLabel.centerX(inView: userView.self)
        percentualLabel.anchor(
            top: userDataStack.bottomAnchor,
            bottom: userView.bottomAnchor,
            paddingTop: 20
        )
        
        winsLabel.anchor(
            top: percentualLabel.bottomAnchor,
            left: winsStack.leftAnchor,
            paddingTop: 40
        )
        
        winsStack.centerX(inView: self)
        winsStack.anchor(
            top: winsLabel.bottomAnchor
        )
        
        disputedLabel.anchor(
            top: winsStack.bottomAnchor,
            left: disputedStack.leftAnchor,
            paddingTop: 20
        )
        
        disputedStack.anchor(
            top: disputedLabel.bottomAnchor,
            left: winsStack.leftAnchor
        )
        
        containerStack.centerX(inView: self)
        containerStack.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            paddingTop: 25
        )
        
        scoreboardWinsLabel.centerY(inView: winsProgressView.self)
        scoreboardWinsLabel.anchor(
            left: winsProgressView.leftAnchor,
            paddingLeft: 20
        )
        
        scoreboardDisputedLabel.centerY(inView: disputedProgressView.self)
        scoreboardDisputedLabel.anchor(
            left: disputedProgressView.leftAnchor,
            paddingLeft: 20
        )
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
