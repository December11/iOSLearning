//
//  HeaderViewModel.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//

import UIKit.UIColor

struct HeaderViewModel {
    let header: String
}

struct DetailViewModel {
    let title: String
    let descriptionText: String
    
    init(descriptions: [String]?, title: String?) {
        self.descriptionText = descriptions?.joined(separator: "\n") ?? ""
        self.title = title ?? ""
    }
}

struct BackgroundSpaceViewModel {
    let color: UIColor?
    
    init(hexString: String) {
        if let color = UIColor(hexString: hexString) {
            self.color = color
        } else {
            self.color = nil
        }
    }
}

struct ColorModel {
    let color: UIColor
}

struct ImageViewModel {
    let url: URL?
    
    init(url: String) {
        if url.isURLVerified {
            self.url = URL(string: url)
        } else {
            self.url = nil
        }
    }
    
}
