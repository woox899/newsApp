//
//  NewsCell.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 27.07.2023.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    static let reuseID = "NewsCell"
    
    let newsTextView: UITextView = {
        let newsTextView = UITextView()
        newsTextView.font = UIFont.systemFont(ofSize: 18, weight: .light)
        newsTextView.textAlignment = .justified
        return newsTextView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: NewsCell.reuseID)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        newsTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newsTextView)
        
        NSLayoutConstraint.activate([
            newsTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            newsTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            newsTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18),
            newsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
