//
//  SeparatorViewModel.swift
//  Task00
//
//  Created by Alla Shkolnik on 21.06.2022.
//

import UIKit

enum ViewModelType {
    case header (String)
    case detail (String, String)
    case image (URL)
    case background (UIColor)
    case separator (CGFloat)
    
    init?(type: String, header: String, title: String, description: [String], url: String, hexString: String) {
        switch type {
            case "header": self = .header(header)
            case "image":
                guard let url = URL(string: url) else { return nil }
                self = .image(url)
            case "background":
                guard let color = UIColor(hexString: hexString) else { return nil }
                self = .background(color)
            case "detail": self = .detail(title, description.joined(separator: "\n"))
            default: return nil
        }
    }
    
    init(separatorWidth: CGFloat) {
        self = .separator(separatorWidth)
    }
}

extension ViewModelType: Equatable {
    static func == (lhs: ViewModelType, rhs: ViewModelType) -> Bool {
        lhs == rhs
    }
}
