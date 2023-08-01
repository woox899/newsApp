//
//  ReactionStackViewCell.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 30.07.2023.
//

import UIKit

final class ReactionStackViewCell: UITableViewCell {
    
    static let reuseID = "ReactionButtonsCell"
    
    private let buttonsBackgroundColor = UIColor.lightGray
    private let buttonsCornerRadius = 8
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.backgroundColor = buttonsBackgroundColor
        likeButton.imageEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
        likeButton.setImage(UIImage(named: "smile"), for: .normal)
        likeButton.imageView?.contentMode = .scaleAspectFit
        likeButton.layer.cornerRadius = CGFloat(buttonsCornerRadius)
        return likeButton
    }()
    
    lazy var dislikeButton: UIButton = {
        let dislikeButton = UIButton()
        dislikeButton.backgroundColor = buttonsBackgroundColor
        dislikeButton.imageEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
        dislikeButton.setImage(UIImage(named: "sad"), for: .normal)
        dislikeButton.imageView?.contentMode = .scaleAspectFit
        dislikeButton.layer.cornerRadius = CGFloat(buttonsCornerRadius)
        return dislikeButton
    }()
    
    lazy var favoritesButton: UIButton = {
        let favoritesButton = UIButton()
        favoritesButton.backgroundColor = buttonsBackgroundColor
        favoritesButton.imageEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
        favoritesButton.setImage(UIImage(named: "star"), for: .normal)
        favoritesButton.imageView?.contentMode = .scaleAspectFit
        favoritesButton.layer.cornerRadius = CGFloat(buttonsCornerRadius)
        return favoritesButton
    }()
    
    lazy var commentButton: UIButton = {
        let commentButton = UIButton()
        commentButton.backgroundColor = buttonsBackgroundColor
        commentButton.imageEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
        commentButton.setImage(UIImage(named: "message"), for: .normal)
        commentButton.imageView?.contentMode = .scaleAspectFit
        commentButton.layer.cornerRadius = CGFloat(buttonsCornerRadius)
        return commentButton
    }()
    
    lazy var shareButton: UIButton = {
        let shareButton = UIButton()
        shareButton.backgroundColor = buttonsBackgroundColor
        shareButton.imageEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        shareButton.imageView?.contentMode = .scaleAspectFit
        shareButton.layer.cornerRadius = CGFloat(buttonsCornerRadius)
        return shareButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: ReactionStackViewCell.reuseID)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(dislikeButton)
        stackView.addArrangedSubview(favoritesButton)
        stackView.addArrangedSubview(commentButton)
        stackView.addArrangedSubview(shareButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
