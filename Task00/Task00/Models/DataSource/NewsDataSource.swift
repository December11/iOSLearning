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

/// С бэка приходит массив NewsDataResponse, где есть тип модели ("header"/ "detail"/"backgroundColoredSpace"/ "image")
/// Когда приходит type: "header" - надо брать в свою модель проперти header
/// Когда приходит type: "detail" - надо брать в свою модель проперти title и всё, что в descriptions (склеить в одну проперти descriptionText через \n)
/// Когда приходит type:  "backgroundColoredSpace" - надо взять только backgroundHex и превратить его в структуру с проперти типа UIColor
/// Когда приходит type: "image" - надо смотреть только на imageURL и создать из текста проперти тип URL, если он корректный
///
/// Если пришёл невалидный type: "unknown" или любой другой неизвестный, то его не надо учитывать и стоит пропускать при конвертации во ViewModels
/// Брать в свою модель - это создать структуру с постфиксом ViewModel, пример для типа header  будет выглядеть так:

//struct HeaderViewModel {
//    let header: String
//}

/// такие же структуры надо сделать для остальных viewModels

final class NewsDataSource {

    // TO-DO надо сделать так, чтобы при установке значения сюда - обновлялись данные в currentScreenItems, вызывав makeScreenItems
    private var loadedResponseModels: [NewsDataResponse]

    init() {
        loadedResponseModels = calculateRandomResponse()
    }

    // SomeYourType - это какой-то тип, который будет объединять/разделять все твои ViewModels разных типов
    // var currentScreenItems: [SomeYourType] = [] // строчку надо раскоментить, как придумаешь тип.

    func item(at index: Int) {
        // TO-DO Надо чтобы этот метод возвращал опциональный тип SomeYourType из массива currentScreenItems (при этом учитывая индексы, чтобы не было крэшей)
    }

    func refreshScreenItems() {
        loadedResponseModels = calculateRandomResponse()
    }

    func makeScreenItems(from responseData: [[NewsDataResponse]]) {
        // TO-DO метод должен возвращать массив [SomeYourType]
    }
}

/*
    1) Надо создать свои ViewModels по примеру HeaderViewModel
    2) Поскольку HeaderViewModel/DetailViewModel/BackgroundSpaceViewModel/ImageViewModel разные, а возвращать в методе
    makeScreenItems нам надо что-то определённого типа, надо подумать как их объединить, чтобы сохранялся порядок и
    возвращался массив [SomeYourType]
    3) Реализовать метод item(at index: Int)
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
    - Написать init в extension на UIColor, чтобы был инициализатор UIColor(hexString: String)
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
