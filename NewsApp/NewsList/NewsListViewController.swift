//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 26.07.2023.
//

import UIKit

protocol NewsListViewControllerProtocol: AnyObject {
    func displayNews(news: NewsListModel)
}

final class NewsListViewController: UIViewController, NewsListViewControllerProtocol, UITableViewDelegate, UITableViewDataSource {
    private var newsListViewControllerTabBarItem = UITabBarItem()
    private let presenter: NewsListPresenterProtocol
    private var newsArray = NewsListModel(articles: [])
    
    private lazy var newsTableView: UITableView = {
        let view = UITableView(frame: view.bounds, style: .plain)
        view.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseID)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = UITableViewCell.SeparatorStyle.none
        return view
    }()
    
    init(presenter: NewsListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        newsListViewControllerTabBarItem = UITabBarItem(title: "Today", image: UIImage(named: "today"), tag: 0)
        self.tabBarItem = newsListViewControllerTabBarItem
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newsTableView)
        presenter.getNews(search: "tesla")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    func displayNews(news: NewsListModel) {
        newsArray = news
        newsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = newsTableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as! NewsTableViewCell
        newsCell.configure(model: newsArray.articles[indexPath.row])
        newsCell.selectionStyle = .none
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NewsTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = newsArray.articles[indexPath.row]
        goToNewsDetailsViewController(article: article)
    }
    
    private func goToNewsDetailsViewController(article: Article) {
        let newsDetailsPresenter: NewsDetailsPresenterProtocol = NewsDetailsPresenter()
        let secondVC: NewsDetailsViewControllerProtocol = NewsDetailsViewController(presenter: newsDetailsPresenter, article: article)
        newsDetailsPresenter.viewController = secondVC
        navigationController?.pushViewController(secondVC as! UIViewController, animated: true)
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.subviews.forEach { $0.removeFromSuperview() }
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "More For You"
    }
}
