//
//  DataLoader.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import Foundation

class DataLoader {
    
    func getOnboardingFlowData() -> [FlowItems] {
        
        var models: [FlowItems] = []
        
        for i in 1...5 {
            
            let newModel = FlowItems(
                titleText: "Title",
                descriptionText: "description",
                step: i
            )
            
            models.append(newModel)
        }
        
        return models
    }
    
    func getMainData() -> [MainItem] {
        
        var models: [MainItem] = []
        
        for i in 1...90 {
            models.append(MainItem(num: i))
        }
        
        return models
    }
}
