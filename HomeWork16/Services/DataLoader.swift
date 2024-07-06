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
                titleText: "Title \(i)",
                descriptionText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                step: i
            )
            
            models.append(newModel)
        }
        
        return models
    }
    
    func getMainData() -> [MainModel] {
        
        var models: [MainModel] = []
        
        for i in 1...90 {
            
            let model = MainModel(
                num: i,
                rgb: (red: Int.random(in: 0...255), 
                      green: Int.random(in: 0...255),
                      blue: Int.random(in: 0...255)))
            
            models.append(model)
        }
        
        return models
    }
}
