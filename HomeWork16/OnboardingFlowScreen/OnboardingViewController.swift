//
//  OnboardingViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class OnboardingViewController: BaseViewController {
    
    var model: OnboardingModel!
    var contentView: OnboardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        model = OnboardingModel()
        model.delegate = self
        
        setupInitialState()
        
        model.loadData()
        
        contentView.pageControl.currentPage = 0
        contentView.pageControl.numberOfPages = model.items.count
        
        contentView.goButton.isHidden = true
    }
    
    private func setupInitialState() {
        
        contentView = OnboardingView(frame: view.frame)
        contentView.delegate = self
        
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        
        view.addSubview(contentView)
        setupConstraints(for: contentView)
        
        contentView.collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.idintifier)
        
        contentView.goButtonActionCompletion = { [weak self] in
            self?.navigationController?.setViewControllers([MainViewController()], animated: true)
        }
    }
}
