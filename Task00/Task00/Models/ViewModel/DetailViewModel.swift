//
//  DetailViewModel.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

struct DetailViewModel {
    let title: String
    let descriptionText: String
    
    init(title: String?, descriptions: [String]?) {
        self.title = title ?? ""
        self.descriptionText = descriptions?.joined(separator: "\n") ?? ""
//        print("## DetailViewModel created with title: \(title ?? "empty") and description: \(descriptionText)")
    }
}

extension DetailViewModel: DecodableModel {
    init() {
        self.title = ""
        self.descriptionText = ""
    }
}
