//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 27.07.2023.
//

import UIKit

protocol NewsDetailsViewControllerProtocol: AnyObject {
    func displayNews(news: NewsListModel)
}

final class NewsDetailsViewController: UIViewController, NewsDetailsViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    
    private let presenter: NewsDetailsPresenterProtocol
    
    private var article: Article
    
    private lazy var secondNewsTabelView: UITableView = {
        let view = UITableView(frame: view.bounds, style: .plain)
        view.register(TopImageCell.self, forCellReuseIdentifier: TopImageCell.reuseID)
        view.register(NewsHeaderCell.self, forCellReuseIdentifier: NewsHeaderCell.reuseID)
        view.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseID)
        view.register(ReactionStackViewCell.self, forCellReuseIdentifier: ReactionStackViewCell.reuseID)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = UITableViewCell.SeparatorStyle.none
        return view
    }()
    
    let navigationBarStackView: UIStackView = {
        let navigationBarStackView = UIStackView()
        navigationBarStackView.axis = .horizontal
        navigationBarStackView.spacing = 15
        navigationBarStackView.distribution = .fillEqually
        return navigationBarStackView
    }()
    
    let shareButton: UIButton = {
        let shareButton = UIButton()
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        shareButton.imageView?.contentMode = .scaleAspectFit
        return shareButton
    }()
    
    let whatsappButton: UIButton = {
        let whatsappButton = UIButton()
        whatsappButton.setImage(UIImage(named: "whatsapp"), for: .normal)
        return whatsappButton
    }()
    
    let messageButton: UIButton = {
        let messageButton = UIButton()
        messageButton.setImage(UIImage(named: "message"), for: .normal)
        return messageButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(secondNewsTabelView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    init(presenter: NewsDetailsPresenterProtocol, article: Article) {
        self.presenter = presenter
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.subviews.forEach { $0.removeFromSuperview() }
        navigationController?.navigationBar.addSubview(navigationBarStackView)
        navigationBarStackView.addArrangedSubview(messageButton)
        navigationBarStackView.addArrangedSubview(whatsappButton)
        navigationBarStackView.addArrangedSubview(shareButton)
        navigationBarStackView.translatesAutoresizingMaskIntoConstraints = false
        
        guard let navigationController = navigationController else {
            return
        }
        
        NSLayoutConstraint.activate([
            navigationBarStackView.trailingAnchor.constraint(equalTo: navigationController.navigationBar.trailingAnchor, constant: -40),
            navigationBarStackView.topAnchor.constraint(equalTo: navigationController.navigationBar.topAnchor, constant: 10),
            navigationBarStackView.heightAnchor.constraint(equalToConstant: 30),
            navigationBarStackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func displayNews(news: NewsListModel) {
        secondNewsTabelView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell {
            switch indexPath.row {
            case 0:
                let topImageCell = secondNewsTabelView.dequeueReusableCell(withIdentifier: TopImageCell.reuseID, for: indexPath) as! TopImageCell
                topImageCell.configure(model: article)
                topImageCell.selectionStyle = .none
                return topImageCell
            case 1:
                let newsHeaderCell = secondNewsTabelView.dequeueReusableCell(withIdentifier: NewsHeaderCell.reuseID, for: indexPath) as! NewsHeaderCell
                newsHeaderCell.newsHeaderCellLabel.text = article.title
                newsHeaderCell.selectionStyle = .none
                return newsHeaderCell
            case 2:
                let reactionStackViewCell = secondNewsTabelView.dequeueReusableCell(withIdentifier: ReactionStackViewCell.reuseID, for: indexPath) as! ReactionStackViewCell
                reactionStackViewCell.selectionStyle = .none
                return reactionStackViewCell
            case 3:
                let newsCell = secondNewsTabelView.dequeueReusableCell(withIdentifier: NewsCell.reuseID, for: indexPath) as! NewsCell
                newsCell.newsTextView.text = article.content
                newsCell.selectionStyle = .none
                return newsCell
            default:
                return UITableViewCell()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 280
        case 1:
            return 100
        case 2:
            return 40
        case 3:
            return 500
        default:
            return 0
        }
    }
}
