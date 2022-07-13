//
//  SeparatorViewModel.swift
//  Task00
//
//  Created by Alla Shkolnik on 21.06.2022.
//

import UIKit

enum ViewModelType {
    
    case header(String)
    case detail(String,String)
    case image(URL)
    case background(UIColor)
    case separator(CGFloat)
    
    init?(type: String, header: String?, title: String?, description: [String], url: String?, hexString: String?) {
        switch type {
        case "header":
            guard let header = header else { return nil }
            self = .header(header)
            
        case "image":
            guard
                let urlString = url,
                let url = URL(string: urlString)
            else { return nil }
            self = .image(url)
            
        case "backgroundColoredSpace":
            guard
                let hexString = hexString,
                let color = UIColor(hexString: hexString)
            else { return nil }
            self = .background(color)
            
        case "detail":
            guard let title = title else { return nil }
            self = .detail(title, description.joined(separator: "\n"))
            
        default:
            return nil
        }
    }
    
   init(separatorWidth: CGFloat) {
        self = .separator(separatorWidth)
    }
    
}

extension ViewModelType: Equatable {
    
    static func ==(lhs: ViewModelType, rhs: ViewModelType) -> Bool {
        lhs == rhs
    }
    
}
