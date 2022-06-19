//
//  BackgroundSpaceViewModel.swift
//  Task00
//
//  Created by Alla Shkolnik on 19.06.2022.
//

import UIKit

struct BackgroundSpaceViewModel {
    let color: UIColor?
    
    init(hexString: String) {
        self.color = UIColor(hexString: hexString) != nil ? UIColor(hexString: hexString) : nil
//        print("## BackgroundSpaceViewModel created with color: \(hexString) and result: \(String(describing: self.color))")
    }
}

extension BackgroundSpaceViewModel: DecodableModel {
    init() {
        self.color = nil
    }
}
