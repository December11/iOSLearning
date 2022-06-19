//
//  ImageViewModel.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import Foundation

struct ImageViewModel: DecodableModel {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}
