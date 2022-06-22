//
//  DataSourceReadable.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

protocol DataSourceProtocol {
    var currentScreenItems: [ViewModelType] { get }
    
    func item(at index: Int) -> ViewModelType?
    func refreshScreenItems()
    func makeScreenItems(from responseData: [[NewsDataResponse]]) -> [ViewModelType]
}
