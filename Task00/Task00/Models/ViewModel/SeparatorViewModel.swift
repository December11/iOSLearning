//
//  SeparatorViewModel.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import UIKit

struct SeparatorViewModel: DecodableModel {
    var separatorWidth: CGFloat = 300.0
    
    /// value задается в %
    /// по умолчанию 10.0
    mutating func increaseWidth(value: CGFloat = 10.0) {
        separatorWidth = separatorWidth + ((separatorWidth * value) / 100.0)
        separatorWidth.round(.awayFromZero)
    }
}
