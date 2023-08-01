//
//  NewsDetailsPresenter.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 28.07.2023.
//

import Foundation

protocol NewsDetailsPresenterProtocol: AnyObject {
    var viewController: NewsDetailsViewControllerProtocol? { get set }
}

final class NewsDetailsPresenter: NewsDetailsPresenterProtocol {
    weak var viewController: NewsDetailsViewControllerProtocol?

}
