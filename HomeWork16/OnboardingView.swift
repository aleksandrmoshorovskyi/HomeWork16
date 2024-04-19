//
//  OnboardingView.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    
}

class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    
    var collectionView: UICollectionView!
    var pageControl: UIPageControl!
    var goButton: UIButton!
    
    var goButtonActionCompletion: (() -> ())?
    
    @objc func goButtonClicked() {
        goButtonActionCompletion?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        // MARK: collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        
        // MARK: pageControl setup
        pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .systemGray5
        pageControl.currentPageIndicatorTintColor = .purple
        
        // MARK: goButton setup
        goButton = UIButton()
        goButton.setTitle("go", for: .normal)
        goButton.setTitleColor(.black, for: .normal)
        goButton.setTitleColor(.gray, for: .highlighted)
        goButton.layer.borderWidth = 1
        goButton.layer.borderColor = UIColor.black.cgColor
        goButton.layer.cornerRadius = Constants.cornerRadius
        goButton.addTarget(self, action: #selector(goButtonClicked), for: .touchUpInside)
        
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(goButton)
    }
    
    func autoresizingMaskOff() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        autoresizingMaskOff()
        
        NSLayoutConstraint.activate([
            // MARK: collectionView constraints
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            //collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.largeInset),
            
            // MARK: pageControl constraints
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Constants.constraintDistance),
            pageControl.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.largeInset)
            
            // MARK: goButton constraints
            goButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: Constants.constraintDistance),
            goButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            goButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.largeInset),
            goButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth)
        ])
    }
}
