//
//  MainView.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    
}

class MainView: UIView {
   
    weak var delegate: MainViewDelegate?
    
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        // MARK: collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(collectionView)
    }
    
    func autoresizingMaskOff() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        autoresizingMaskOff()
        
        NSLayoutConstraint.activate([
            // MARK: collectionView constraints
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: .zero)
        ])
    }
}
