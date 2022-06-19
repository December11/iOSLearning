//
//  String.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//
import UIKit

extension String {
    var isURLVerified: Bool {
        if let url = NSURL(string: self) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
}
