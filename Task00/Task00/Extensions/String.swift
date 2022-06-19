//
//  String.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//
import UIKit

extension String {
    var isURLVerified: Bool {
        return canOpenFTP() || canOpenHTTP() || canOpenHTTPS()
    }
    
    private func canOpenFTP() -> Bool {
        let urlString = "ftp://" + self.lowercased()
        if let url = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    private func canOpenHTTP() -> Bool {
        let urlString = "http://" + self.lowercased()
        if let url = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    private func canOpenHTTPS() -> Bool {
        let urlString = "https://" + self.lowercased()
        if let url = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    private func hasURLScheme() -> Bool {
        hasFTPScheme() || hasHTTPScheme() || hasHTTPScheme()
    }
    
    private func hasFTPScheme() -> Bool {
        self.lowercased().hasPrefix("ftp://")
    }
    
    private func hasHTTPScheme() -> Bool {
        self.lowercased().hasPrefix("http://")
    }
    
    private func hasHTTPSScheme() -> Bool {
        self.lowercased().hasPrefix("https://")
    }
    
}
