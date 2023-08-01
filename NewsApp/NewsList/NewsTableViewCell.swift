//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 26.07.2023.
//

import UIKit
import Kingfisher

final class NewsTableViewCell: UITableViewCell {
    static let reuseID = "NewsTableViewCell"
    static let cellHeight: CGFloat = 120
    
    private var model: Article?
    
    private let newsDate: UILabel = {
        let newsDate = UILabel()
        newsDate.font = UIFont.systemFont(ofSize: 10, weight: .light)
        return newsDate
    }()
    
    private let autorNewsLabel: UILabel = {
        let autorNewsLabel = UILabel()
        autorNewsLabel.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return autorNewsLabel
    }()
    
    private let descriptionNewsLabel: UILabel = {
        let descriptionNewsLabel = UILabel()
        descriptionNewsLabel.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        descriptionNewsLabel.numberOfLines = 0
        descriptionNewsLabel.sizeToFit()
        return descriptionNewsLabel
    }()
    
    private let newsImageView: UIImageView = {
        let newsImageView = UIImageView()
        newsImageView.layer.cornerRadius = 8
        newsImageView.clipsToBounds = true
        return newsImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Self.reuseID)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: Article) {
        self.model = model
        descriptionNewsLabel.text = model.title
        autorNewsLabel.text = model.author

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        if let publishedAt = model.publishedAt {
            newsDate.text = dateFormatter.string(from: publishedAt)
        }
        
        if let imageUrlStr = model.urlToImage, let imageUrl = URL(string: imageUrlStr) {
            newsImageView.kf.setImage(with: imageUrl)
        }
    }
    
    private func setupUI() {
        contentView.addSubview(descriptionNewsLabel)
        contentView.addSubview(autorNewsLabel)
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsDate)
        
        autorNewsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionNewsLabel.translatesAutoresizingMaskIntoConstraints = false
        newsDate.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            autorNewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            autorNewsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            autorNewsLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -23),
            autorNewsLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionNewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            descriptionNewsLabel.topAnchor.constraint(equalTo: autorNewsLabel.bottomAnchor, constant: 5),
            descriptionNewsLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -23),
            
            newsImageView.leadingAnchor.constraint(equalTo: descriptionNewsLabel.trailingAnchor, constant: 23),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            newsImageView.widthAnchor.constraint(equalToConstant: 130),
            
            newsDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            newsDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            newsDate.topAnchor.constraint(equalTo: descriptionNewsLabel.bottomAnchor, constant: 5),
            newsDate.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -23),
            newsDate.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
