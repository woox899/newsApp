//
//  TopImageCell.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 27.07.2023.
//

import UIKit

final class TopImageCell: UITableViewCell {
    
    static let reuseID = "ImageCell"
    
    let imageCell: UIImageView = {
        let imageCell = UIImageView()
        return imageCell
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.reuseID)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Article) {
        if let imageUrlStr = model.urlToImage, let imageUrl = URL(string: imageUrlStr) {
            imageCell.kf.setImage(with: imageUrl)
        }
    }
    
    private func setupUI() {
        contentView.addSubview(imageCell)
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
