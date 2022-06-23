//
//  BeautifulDataSource.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import CoreGraphics

final public class BeautifulDataSource: DataSourceProtocol {

    private(set) var currentScreenItems: [ViewModelType] = []
    private var loadedResponseModels: [NewsDataResponse] = []
    
    public init() {
        let news = NewsService.calculateRandomResponse()
        self.currentScreenItems = self.makeScreenItems(from: [news])
        self.loadedResponseModels = news
    }
    
    func item(at index: Int) -> ViewModelType? {
        let slice = currentScreenItems[index...].enumerated().filter { $0.offset % 2 == 0 }
        return currentScreenItems[slice.startIndex]
    }
    
    public func refreshScreenItems() {
        loadedResponseModels = NewsService.calculateRandomResponse()
    }

    func makeScreenItems(from responseData: [[NewsDataResponse]]) -> [ViewModelType] {
        var models: [ViewModelType] = []
        responseData.forEach { newsDataResponses in
            newsDataResponses.forEach { response in
                guard let item = ViewModelType(
                    type: response.type,
                    header: response.header ?? "",
                    title: response.title ?? "",
                    description: response.descriptions,
                    url: response.imageURL ?? "",
                    hexString: response.backgroundHexColor ?? ""
                )
                else { return }
                models.append(item)
            }
        }
        models = createSeparatedViewModels(to: models)
        return models
    }
    
    private func createSeparatedViewModels(to array: [ViewModelType]) -> [ViewModelType] {
        var newArray = array
        var currentSeparatorWidth: CGFloat = 300.0
        for index in 0 ..< 2 * array.count - 1 where index % 2 != 0 {
            if index == 1 {
                newArray.insert(ViewModelType(separatorWidth: 300.0), at: index)
            } else {
                currentSeparatorWidth += currentSeparatorWidth * 10.0 / 100.0
                currentSeparatorWidth.round(.awayFromZero)
                newArray.insert(ViewModelType(separatorWidth: currentSeparatorWidth), at: index)
            }
        }
        return newArray
    }
}
