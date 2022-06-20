//
//  BeautifulDataSource.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import UIKit

final public class BeautifulDataSource: DataSourceReadable {

    var currentScreenItems: [DecodableModel] = []
    var separatorWidth: CGFloat = 300.0
    
    private var loadedResponseModels: [NewsDataResponse] = []

    public init() {
        let news = NewsResponses.randomNews.calculateRandomResponse()
        self.currentScreenItems = self.makeScreenItems(from: [news])
        self.loadedResponseModels = news
    }

    func item(at index: Int) -> DecodableModel? {
        var newIndex = index
        if newIndex % 2 != 0 {
            newIndex += 1
        }
        guard newIndex >= 0 && newIndex < currentScreenItems.count else { return nil }
        return currentScreenItems[newIndex]
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
        addSeparators(to: &models)
        return models
    }
    
    private func addSeparators(to array: inout [DecodableModel]) {
        for index in 0..<2 * array.count-1 {
            if index % 2 != 0 {
                array.insert(getSeparator(isFirst: index == 1), at: index)
            }
        }
    }
    
    private func getSeparator(isFirst: Bool) -> SeparatorViewModel {
        if isFirst {
            separatorWidth = 300.0
            return SeparatorViewModel()
        }
        var separator = SeparatorViewModel(separatorWidth: separatorWidth)
        separator.increaseWidth()
        separatorWidth = separator.separatorWidth
        return separator
    }
}
