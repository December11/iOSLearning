//
//  NewsDataSource.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 18.06.2022.
//

import UIKit

final class NewsDataSource: DataSourceReadable {

    var currentScreenItems: [DecodableModel] = []
    
    private(set) var loadedResponseModels: [NewsDataResponse] {
        didSet {
            currentScreenItems = makeScreenItems(from: [oldValue])
        }
    }

    init() {
        loadedResponseModels = NewsResponses.shared.news
       // loadedResponseModels = calculateRandomResponse()
        currentScreenItems = makeScreenItems(from: [loadedResponseModels])
    }

    func item(at index: Int) -> DecodableModel? {
        guard index >= 0 && index < currentScreenItems.count else { return nil }
        return currentScreenItems[index]
    }

    func refreshScreenItems() {
        //loadedResponseModels = calculateRandomResponse()
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

