//
//  UIColor.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//

import UIKit

extension UIColor {
    
    convenience init? (hexString: String, a: CGFloat = 1.0) {
        let hexValue = hexString.hasPrefix("#") ? String(hexString.dropFirst()) : hexString
        let scanner = Scanner(string: hexValue)
        var hexNumber: UInt64 = 0
        guard
            hexValue.count == 6,
            scanner.scanHexInt64(&hexNumber)
        else {
            return nil
        }
        
        self.init(
            red: CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexNumber & 0x0000FF) / 255.0,
            alpha: a
        )
    }
    
}
