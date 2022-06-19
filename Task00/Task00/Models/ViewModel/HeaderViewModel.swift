//
//  HeaderViewModel.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//

struct HeaderViewModel {
    let header: String
    init(header: String) {
        self.header = header
//        print("## HeaderViewModel created with header: \(header)")
    }
}

extension HeaderViewModel: DecodableModel {
    init() {
        self.header = ""
    }
}
