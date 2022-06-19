//
//  ViewController.swift
//  Task00
//
//  Created by 👩🏻‍🎨 📱 december11 on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {

    let source = NewsDataSource()
    let beautifulSource = BeautifulDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("source count is: \(source.loadedResponseModels.count). Items:\n")
        for item in source.loadedResponseModels {
            print(item)
        }
        print("screenItems is: \(source.currentScreenItems.count). Items:")
        for item in source.currentScreenItems {
            print(item)
        }
        let half = source.currentScreenItems.count / 2
        print("\nsource.item[\(half)] = \(String(describing: source.item(at: half)))")
        
        print("\n\n- - - BeautifulDataSource - - -")
        print("screenItems is: \(beautifulSource.currentScreenItems.count). Items:\n")
        for item in beautifulSource.currentScreenItems {
            print(item)
        }
        var half2 = beautifulSource.currentScreenItems.count / 2
        print(half2)
        
        if half2 % 2 != 0 {
            half2 += 1
        }
        print("\nsource.item[\(half2)] = \(String(describing: beautifulSource.item(at: half2)))")
    }
    
}

