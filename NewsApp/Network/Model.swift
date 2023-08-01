
import Foundation

struct NewsListModel: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title, description: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?
}
