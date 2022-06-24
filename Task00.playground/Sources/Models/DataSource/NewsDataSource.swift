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
        self.currentScreenItems = Self.makeScreenItems(from: news)
        self.loadedResponseModels = news
    }
    
    func item(at index: Int) -> ViewModelType? {
        guard currentScreenItems.indices.contains(index) else { return nil }
        return currentScreenItems[index]
    }

    public func refreshScreenItems() {
        loadedResponseModels = NewsService.calculateRandomResponse()
    }
    
    static func makeScreenItems(from responseData: [NewsDataResponse]) -> [ViewModelType] {
        var models: [ViewModelType] = []
        responseData.forEach { response in
            guard let item = ViewModelType(
                type: response.type,
                header: response.header ?? "",
                title: response.title ?? "",
                description: response.descriptions,
                url: response.imageURL ?? "",
                hexString: response.backgroundHexColor ?? ""
            ) else {
                return
            }

            models.append(item)
        }

        return models
    }
}
