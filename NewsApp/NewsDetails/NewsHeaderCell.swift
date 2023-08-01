//
//  NewsHeaderCell.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 27.07.2023.
//

import UIKit

final class NewsHeaderCell: UITableViewCell {
    
    static let reuseID = "NewsHeaderCell"
    
    let newsHeaderCellLabel: UILabel = {
        let newsHeaderCellLabel = UILabel()
        newsHeaderCellLabel.font = UIFont.systemFont(ofSize: 18, weight: .black)
        newsHeaderCellLabel.numberOfLines = 0
        return newsHeaderCellLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: NewsHeaderCell.reuseID)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(newsHeaderCellLabel)
        newsHeaderCellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsHeaderCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            newsHeaderCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsHeaderCellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            newsHeaderCellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
        
    }
}
