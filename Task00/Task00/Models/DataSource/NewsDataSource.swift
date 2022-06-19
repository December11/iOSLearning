//
//  NewsDataSource.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 18.06.2022.
//

import UIKit

final class NewsDataSource: DataSourceReadable {

    var currentScreenItems: [DecodableModel] = []
    
    private var loadedResponseModels: [NewsDataResponse] {
        get {
            return NewsResponses.shared.news
        }
        set {
            currentScreenItems = makeScreenItems(from: [newValue])
        }
    }

    init() {
        loadedResponseModels = NewsResponses.shared.news
    }

    func item(at index: Int) -> DecodableModel? {
        guard index >= 0 && index < currentScreenItems.count else { return nil }
        return currentScreenItems[index]
    }

    func refreshScreenItems() {
        loadedResponseModels = NewsResponses.shared.news
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
