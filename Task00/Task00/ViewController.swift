//
//  ViewController.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {

    let source = NewsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("source count is: \(source.loadedResponseModels.count). Items:")
        for item in source.loadedResponseModels {
            print(item)
        }
        print("screenItems is: \(source.currentScreenItems.count). Items:")
        for item in source.currentScreenItems {
            print(item)
        }
        
        let string: String = "yandex.com"
        print(string.isURLVerified)
    }
    
}

