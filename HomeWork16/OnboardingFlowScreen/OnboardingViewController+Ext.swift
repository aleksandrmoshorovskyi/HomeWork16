//
//  OnboardingViewController+Ext.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 19.04.2024.
//

import UIKit

// MARK: OnboardingModelDelegate
extension OnboardingViewController: OnboardingModelDelegate {
    
    func dataDidLoad() {
        contentView.collectionView.reloadData()
    }
}

// MARK: OnboardingViewDelegate
extension OnboardingViewController: OnboardingViewDelegate {
    
}
