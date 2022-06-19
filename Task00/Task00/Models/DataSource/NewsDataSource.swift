//
//  NewsDataSource.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 18.06.2022.
//

import UIKit

struct NewsDataResponse {
    let type: String
    let header: String?
    let imageURL: String?
    let title: String?
    let backgroundHexColor: String?
    let descriptions: [String]
}

final class NewsDataSource: DataSourceReadable {

    var currentScreenItems: [DecodableModel] = []
    
    private(set) var loadedResponseModels: [NewsDataResponse] {
        didSet {
            currentScreenItems = makeScreenItems(from: [oldValue])
        }
    }

    init() {
        loadedResponseModels = calculateRandomResponse()
        currentScreenItems = makeScreenItems(from: [loadedResponseModels])
    }

    func item(at index: Int) -> DecodableModel? {
        guard index >= 0 && index < currentScreenItems.count else { return nil }
        return currentScreenItems[index]
    }

    func refreshScreenItems() {
        loadedResponseModels = calculateRandomResponse()
    }

    func makeScreenItems(from responseData: [[NewsDataResponse]]) -> [DecodableModel] {
//        let header = HeaderViewModel()
//        let detail = DetailViewModel()
//        let background = BackgroundSpaceViewModel()
//        let image = ImageViewModel()
//
//        var models: [DecodableModel] = [header, detail, background, image]
//        responseData.forEach { newsDataResponses in
//            newsDataResponses.forEach { response in
//                switch (response.type) {
//                case "header":
//                    models[0] = HeaderViewModel(header: response.header ?? "")
//                case "detail":
//                    models[1] = DetailViewModel(title: response.title ?? "", descriptions: response.descriptions)
//                case "backgroundColoredSpace":
//                    models[2] = BackgroundSpaceViewModel(hexString: response.backgroundHexColor ?? "")
//                case "image":
//                    models[3] = ImageViewModel(url: response.imageURL ?? "")
//                case "unknown":
//                    return
//                default:
//                    return
//                }
//            }
//        }
//        return models
        
        var models: [DecodableModel] = []
        responseData.forEach { newsDataResponses in
            newsDataResponses.forEach { response in
                switch (response.type) {
                case "header":
                    models.append(HeaderViewModel(header: response.header ?? ""))
                case "detail":
                    models.append(DetailViewModel(title: response.title ?? "", descriptions: response.descriptions))
                case "backgroundColoredSpace":
                    models.append(BackgroundSpaceViewModel(hexString: response.backgroundHexColor ?? ""))
                case "image":
                    models.append(ImageViewModel(url: response.imageURL ?? ""))
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

final class BeautifulDataSource: DataSourceReadable {

    var currentScreenItems: [DecodableModel] = []
    
    private var loadedResponseModels: [NewsDataResponse] {
        didSet {
            currentScreenItems = makeScreenItems(from: [oldValue])
        }
    }

    init() {
        loadedResponseModels = calculateRandomResponse()
        currentScreenItems = makeScreenItems(from: [loadedResponseModels])
    }

    func item(at index: Int) -> DecodableModel? {
        guard index >= 0 && index < currentScreenItems.count else { return nil }
        return currentScreenItems[index]
    }

    func refreshScreenItems() {
        loadedResponseModels = calculateRandomResponse()
    }

    func makeScreenItems(from responseData: [[NewsDataResponse]]) -> [DecodableModel] {
//        let header = HeaderViewModel()
//        let detail = DetailViewModel()
//        let background = BackgroundSpaceViewModel()
//        let image = ImageViewModel()
//
//        var models: [DecodableModel] = [header, detail, background, image]
//        responseData.forEach { newsDataResponses in
//            newsDataResponses.forEach { response in
//                switch (response.type) {
//                case "header":
//                    models[0] = HeaderViewModel(header: response.header ?? "")
//                case "detail":
//                    models[1] = DetailViewModel(title: response.title ?? "", descriptions: response.descriptions)
//                case "backgroundColoredSpace":
//                    models[2] = BackgroundSpaceViewModel(hexString: response.backgroundHexColor ?? "")
//                case "image":
//                    models[3] = ImageViewModel(url: response.imageURL ?? "")
//                case "unknown":
//                    return
//                default:
//                    return
//                }
//            }
//        }
//        return models
        
        var models: [DecodableModel] = []
        responseData.forEach { newsDataResponses in
            newsDataResponses.forEach { response in
                switch (response.type) {
                case "header":
                    models.append(HeaderViewModel(header: response.header ?? ""))
                case "detail":
                    models.append(DetailViewModel(title: response.title ?? "", descriptions: response.descriptions))
                case "backgroundColoredSpace":
                    models.append(BackgroundSpaceViewModel(hexString: response.backgroundHexColor ?? ""))
                case "image":
                    models.append(ImageViewModel(url: response.imageURL ?? ""))
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

/*
    /// 1) Надо создать свои ViewModels по примеру HeaderViewModel // done
    /// 2) Поскольку HeaderViewModel/DetailViewModel/BackgroundSpaceViewModel/ImageViewModel разные, а возвращать в методе
    makeScreenItems нам надо что-то определённого типа, надо подумать как их объединить, чтобы сохранялся порядок и
    возвращался массив [SomeYourType] // done
    /// 3) Реализовать метод item(at index: Int) // done
    4) Создать протокол со всеми internal (не приватными) интерфейсами.
    5) Подписать протокол на NewsDataSource, сделать проперти currentScreenItems - только на чтение через протокол.
    6) Создать BeautifulDataSource, где будет абсолютно такой же инит и схожая реализация
    , но с единственным различием, добавляется:

    struct SeparatorViewModel {
        let separatorWidth: CGFloat // по умолчанию можно установить в 300.0
    }

    В метод calculateRandomResponse() ничего не надо добавлять, с сепаратором работаем только, где ViewModels

    Сепаратор надо вставлять между currentScreenItems, то есть,
    если раньше у нас был [HeaderViewModel, DetailViewModel, BackgroundSpaceViewModel], то теперь будет
    [HeaderViewModel, SeparatorViewModel, DetailViewModel, SeparatorViewModel, BackgroundSpaceViewModel]

    Надо предусмотреть:
        - если будет только один NewsDataResponse, с каким-то типом, то сепаратор не нужен.
        - если это последний элемент, то за ним не должно быть separator.

    P.S. метод func item(at index: Int) -> SomeYourType потребует в BeautifulDataSource доработку,
    если в старом NewsDataSource мы тупо брали значение из массива, то теперь мы должны брать следующее значение после элемента.
    Например для массива [HeaderViewModel, SeparatorViewModel, DetailViewModel, SeparatorViewModel, BackgroundSpaceViewModel],
    если мы возьмём элемент под индексом 3, то у нас попадёт на SeparatorViewModel => надо взять следующее значение от него, то есть
    BackgroundSpaceViewModel


    Задание со *
    - Написать init в extension на UIColor, чтобы был инициализатор UIColor(hexString: String) // done
    - Каждый следующий separator в BeautifulDataSource увеличивать width на 10 % (начиная с 300.0).


    По итогу должно быть два класса с реализованным функционалом по правилам выше. Один общий протокол.
    У которых можно будет вызывать refreshScreenItems().
 */


/// Этот метод трогать нельзя, он симулирует загрузку данных для задания
private func calculateRandomResponse() -> [NewsDataResponse] {

    let header = NewsDataResponse(
        type: "header",
        header: "Нельзя сливать данные с Хурала",
        imageURL: nil,
        title: nil,
        backgroundHexColor: nil,
        descriptions: []
    )

    let detail = NewsDataResponse(
        type: "detail",
        header: nil,
        imageURL: nil,
        title: "Что было на хурале за 26.02.98",
        backgroundHexColor: nil,
        descriptions: ["Рассказали про то, что мы крутые.", "Убрали копейки, которые добавили.", "Метрики Роста."]
    )

    let backgroundColoredSpace = NewsDataResponse(
        type: "backgroundColoredSpace",
        header: nil,
        imageURL: nil,
        title: nil,
        backgroundHexColor: "#fcba03",
        descriptions: []
    )

    let image = NewsDataResponse(
        type: "image",
        header: nil,
        imageURL: "www.yandex.ru",
        title: nil,
        backgroundHexColor: nil,
        descriptions: []
    )

    let badImage = NewsDataResponse(
        type: "image",
        header: nil,
        imageURL: "KEK KEK KEK",
        title: nil,
        backgroundHexColor: nil,
        descriptions: []
    )

    let badType = NewsDataResponse(
        type: "unknown",
        header: nil,
        imageURL: "KEK KEK KEK",
        title: nil,
        backgroundHexColor: nil,
        descriptions: []
    )

    let detailSecond = NewsDataResponse(
        type: "detail",
        header: nil,
        imageURL: nil,
        title: "Что было на дискашене в iOS команде",
        backgroundHexColor: nil,
        descriptions: ["Рассказали про то, что мы крутые.", "Убрали копейки, которые добавили.", "Метрики Роста."]
    )

    let backgroundColoredSpaceSecond = NewsDataResponse(
        type: "backgroundColoredSpace",
        header: nil,
        imageURL: nil,
        title: nil,
        backgroundHexColor: "#fcba03",
        descriptions: []
    )

    let imageSecond = NewsDataResponse(
        type: "image",
        header: nil,
        imageURL: "www.yandex.ru",
        title: nil,
        backgroundHexColor: nil,
        descriptions: []
    )

    let badImageSecond = NewsDataResponse(
        type: "image",
        header: nil,
        imageURL: "KEK KEK KEK",
        title: nil,
        backgroundHexColor: nil,
        descriptions: []
    )

    let exampleFullArray = [
        header,
        detail,
        backgroundColoredSpace,
        image,
        badImage,
        badType,
        detailSecond,
        backgroundColoredSpaceSecond,
        imageSecond,
        badImageSecond
    ]

    let randomCount = Int(arc4random_uniform(UInt32(exampleFullArray.count - 1)))
    return exampleFullArray.shuffled().dropLast(randomCount)
}

