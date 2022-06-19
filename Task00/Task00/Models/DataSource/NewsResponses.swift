//
//  NewsResponses.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import Foundation

struct NewsDataResponse {
    let type: String
    let header: String?
    let imageURL: String?
    let title: String?
    let backgroundHexColor: String?
    let descriptions: [String]
}

final class NewsResponses {
    static let shared = NewsResponses()
    
    var news: [NewsDataResponse] = []
    
    private init() {
        self.news = calculateRandomResponse()
    }
    
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
}
