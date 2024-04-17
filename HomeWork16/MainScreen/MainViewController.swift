//
//  MainViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var model: MainModel!
    var contentView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = MainModel()
        model.delegate = self
        
        contentView = MainView(frame: view.frame)
        contentView.delegate = self
        
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        
        view.addSubview(contentView)
        setupConstraints()
        
        contentView.collectionView.register(
            MainCell.self,
            forCellWithReuseIdentifier: MainCell.idintifier
        )
    }
    
    private func setupConstraints() {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // MARK: - contentView Constraints
            contentView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: .zero
            ),
            contentView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: .zero
            ),
            contentView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: .zero
            ),
            contentView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: .zero
            )
        ])
    }
}

extension MainViewController: MainModelDelegate {
    
    func dataDidLoad() {
        contentView.collectionView.reloadData()
    }
}

extension MainViewController: MainViewDelegate {
    
}
