//
//  MainModel.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import Foundation

protocol MainModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class MainModel: NSObject {
    
    weak var delegate: MainModelDelegate?
    
    var dataLoader = DataLoader()
    
    var items: [MainItem] = []
    
    func loadData() {
        items = dataLoader.getMainData()
        delegate?.dataDidLoad()
    }
}
