//
//  OnboardingViewController+CollectionView.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

// MARK: UICollectionViewDelegate
extension OnboardingViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let scrollPosition = scrollView.contentOffset.x / scrollView.bounds.width
        
        contentView.pageControl.currentPage = scrollPosition.isNaN ? 0 : Int(round(scrollPosition))
        
        contentView.goButton.isHidden = (contentView.pageControl.currentPage != model.items.count - 1)
        
        contentView.adaptForContent()
    }
}

// MARK: UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCell.idintifier,
            for: indexPath) as? OnboardingCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        cell.titleLabel.text = model.items[indexPath.row].titleText
        cell.descriptionText.text = model.items[indexPath.row].descriptionText
        cell.stepLabel.text = "STEP \(model.items[indexPath.row].step)"
        
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
}
