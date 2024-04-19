//
//  MainModel.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import Foundation

class MainModel {
    
    var num: Int
    var rgb: (red: Int, green: Int, blue: Int)
    
    init(num: Int, rgb: (red: Int, green: Int, blue: Int)) {
        self.num = num
        self.rgb = rgb
    }
}
