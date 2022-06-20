//
//  DataSourceReadable.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import Foundation

protocol DataSourceReadable {
    var currentScreenItems: [DecodableModel] { get }
    
    init()
    
    func item(at index: Int) -> DecodableModel?
    func refreshScreenItems()
    func makeScreenItems(from responseData: [[NewsDataResponse]]) -> [DecodableModel]
}
