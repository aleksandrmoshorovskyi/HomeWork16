//
//  OnboardingModel.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import Foundation

protocol OnboardingModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class OnboardingModel {
    
    weak var delegate: OnboardingModelDelegate?
 
    var dataLoader = DataLoader()
    
    var items: [FlowItems] = []
    
    func loadData() {
        items = dataLoader.getOnboardingFlowData()
        delegate?.dataDidLoad()
    }
}
