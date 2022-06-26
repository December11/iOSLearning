//
//  BeautifulDataSource.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import CoreGraphics

final public class BeautifulDataSource: DataSourceProtocol {

    private(set) var currentScreenItems: [ViewModelType]
    private var loadedResponseModels: [NewsDataResponse]
    
    public init() {
        let news = NewsService.calculateRandomResponse()
        self.currentScreenItems = Self.makeScreenItems(from: news)
        self.loadedResponseModels = news
    }
    
    func item(at index: Int) -> ViewModelType? {
        currentScreenItems[index...].first { $0 != getSeparator(of: index) }
    }
    
    public func refreshScreenItems() {
        loadedResponseModels = NewsService.calculateRandomResponse()
    }

    ///forEatch map filter compactMap reduce allSatisfy sort sorted
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
        models = BeautifulDataSource().createSeparatedViewModels(to: models)

        return models
    }
    
    private func createSeparatedViewModels(to array: [ViewModelType]) -> [ViewModelType] {
        var results = array
        _ = results.enumerated().compactMap({ index, element in
            guard results.indices.contains(index.nextOdd) else { return }
            results.insert(getSeparator(of: index.nextOdd), at: index.nextOdd)
        })
        return array
    }
    
    private func getSeparator(of startIndex: Int) -> ViewModelType {
        var currentSeparatorWidth: CGFloat = 300.0
        let correctedIndex = startIndex.isOdd ? startIndex : startIndex + 1
        if startIndex >= 2 {
            let indicies = [Int](2...correctedIndex)
            _ = indicies.filter { $0.isOdd }.map { index in
                currentSeparatorWidth += currentSeparatorWidth.tenPercents
                currentSeparatorWidth.round(.awayFromZero)
            }
        }
        return ViewModelType(separatorWidth: currentSeparatorWidth)
    }
}
