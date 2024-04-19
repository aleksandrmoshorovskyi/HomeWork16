//
//  MainViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class MainViewController: BaseViewController {
 
    var dataModel: [MainModel] = []
    var contentView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        dataModel = DataLoader().getMainData()
        
        setupInitialState()
    }
    
    func setupInitialState() {
        
        contentView = MainView(frame: view.frame)
        contentView.delegate = self
        
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        
        view.addSubview(contentView)
        
        setupConstraints(for: contentView)
        
        contentView.collectionView.register(
            MainCell.self,
            forCellWithReuseIdentifier: MainCell.idintifier
        )
    }
}
