//
//  MainService.swift
//  NewsApp
//
//  Created by Андрей Бабкин on 26.07.2023.
//

import Foundation

class MainService {

    static let shared = MainService()

    private var url = URLComponents(string: "https://newsapi.org/v2/everything?")
    private var secretAPIKey = URLQueryItem(name: "apiKey", value: "9622a47c243448c1aa338df9537d8def")

    func getNews(search: String, completion: @escaping (NewsListModel) -> Void) {
        guard var url else { return }
        var q = URLQueryItem(name: "q", value: search)
        url.queryItems?.append(q)
        url.queryItems?.append(secretAPIKey)
        guard let newsUrl = url.url else { return }
        var request = URLRequest(url: newsUrl)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let newsData = try? decoder.decode(NewsListModel.self, from: data) {
                completion(newsData)
            }
        }
        task.resume()
        
    }
}
