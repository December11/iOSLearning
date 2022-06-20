//
//  NewsDataSource.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 18.06.2022.
//

import UIKit

final public class NewsDataSource: DataSourceReadable {

    var currentScreenItems: [DecodableModel] = []
    
    private var loadedResponseModels: [NewsDataResponse] = []

    public init() {
        let news = NewsResponses.randomNews.calculateRandomResponse()
        self.currentScreenItems = self.makeScreenItems(from: [news])
        self.loadedResponseModels = news
    }

    func item(at index: Int) -> DecodableModel? {
        guard index >= 0 && index < currentScreenItems.count else { return nil }
        return currentScreenItems[index]
    }

    public func refreshScreenItems() {
        loadedResponseModels = NewsResponses.randomNews.calculateRandomResponse()
    }

    func makeScreenItems(from responseData: [[NewsDataResponse]]) -> [DecodableModel] {
        var models: [DecodableModel] = []
        responseData.forEach { newsDataResponses in
            newsDataResponses.forEach { response in
                switch (response.type) {
                case "header":
                    guard let header = response.header else { return }
                    models.append(HeaderViewModel(header: header))
                case "detail":
                    models.append(DetailViewModel(title: response.title ?? "", descriptions: response.descriptions))
                case "backgroundColoredSpace":
                    guard
                        let hexString = response.backgroundHexColor,
                        let color = UIColor(hexString: hexString)
                    else { return }
                    models.append(BackgroundSpaceViewModel(color: color))
                case "image":
                    guard
                        let urlString = response.imageURL,
                        urlString.isURLVerified,
                        let url = URL(string: urlString)
                    else { return }
                    models.append(ImageViewModel(url: url))
                case "unknown":
                    return
                default:
                    return
                }
            }
        }
        return models
    }
}
