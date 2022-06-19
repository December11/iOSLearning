//
//  ImageViewModel.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import Foundation

struct ImageViewModel {
    let url: URL?
    
    init(url: String) {
        self.url = url.isURLVerified ? URL(string: url) : nil
//        print("## BackgroundSpaceViewModel created with url: \(url) and result: \(String(describing: url))")
    }
}

extension ImageViewModel: DecodableModel {
    init() {
        self.url = URL(string: "")
    }
}
