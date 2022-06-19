//
//  UIColor.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//

import UIKit.UIColor

extension UIColor {
    convenience init? (hexString: String) {
        let hexValue = hexString.hasPrefix("#") ? String(hexString.dropFirst()) : hexString
        let scanner = Scanner(string: hexValue)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: CGFloat((hexNumber & 0xff0000) >> 16 / 255),
                green: CGFloat((hexNumber & 0x00ff00) >> 8 / 255),
                blue: CGFloat((hexNumber & 0x0000ff) >> 0 / 255),
                alpha: 1.0)
        }
        return nil
    }
}
