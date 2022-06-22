//
//  NewsDataSource.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 18.06.2022.
//

final public class NewsDataSource: DataSourceProtocol {

    private(set) var currentScreenItems: [ViewModelType] = []
    private var loadedResponseModels: [NewsDataResponse] = []

    public init() {
        let news = NewsService.calculateRandomResponse()
        self.currentScreenItems = self.makeScreenItems(from: [news])
        self.loadedResponseModels = news
    }
    
    func item(at index: Int) -> ViewModelType? {
        currentScreenItems[index...].first { $0 != .separator(0) }
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
        return models
    }
}
