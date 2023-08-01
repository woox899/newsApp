//
//  NewsListPresenter.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 27.07.2023.
//

import Foundation

protocol NewsListPresenterProtocol: AnyObject {
    var viewController: NewsListViewControllerProtocol? { get set }
    func getNews(search: String)
}

final class NewsListPresenter: NewsListPresenterProtocol {
    weak var viewController: NewsListViewControllerProtocol?
    
    func getNews(search: String) {
        MainService.shared.getNews(search: search) { [weak self] news in
            DispatchQueue.main.async {
                self?.viewController?.displayNews(news: news)
            }
        }
    }
}
