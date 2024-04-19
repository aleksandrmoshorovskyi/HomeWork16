//
//  OnboardingCell.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let idintifier = "OnboardingCell"
    
    lazy var backView: UIView = {
        
        let view = UIView()
        
        view.layer.cornerRadius = Constants.cornerRadius
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.backgroundColor = Constants.bgColorLabel
        label.textAlignment = Constants.textAlignment
        label.font = Constants.font
        
        return label
    }()
    
    lazy var descriptionText: UITextView = {
        
        let textView = UITextView()
        
        textView.backgroundColor = Constants.bgColorLabel
        textView.textAlignment = Constants.textAlignment
        textView.font = Constants.font
        
        return textView
    }()
    
    lazy var stepLabel: UILabel = {
        
        let label = UILabel()
        
        label.backgroundColor = Constants.bgColorLabel
        label.textAlignment = Constants.textAlignment
        label.font = .systemFont(ofSize: 40)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBackground
        backView.backgroundColor = .systemGray6
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(backView)
        addSubview(titleLabel)
        addSubview(descriptionText)
        addSubview(stepLabel)
    }
    
    func autoresizingMaskOff() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        stepLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        autoresizingMaskOff()
        
        NSLayoutConstraint.activate([
            // MARK: backView constraints
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.inset),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.inset),
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.largeInset),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.inset),
            
            // MARK: titleLabel constraints
            titleLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.constraintDistance),
            titleLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -Constants.constraintDistance),
            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.constraintDistance),
            //titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.constraintDistance),
            
            // MARK: descriptionText constraints
            descriptionText.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.constraintDistance),
            descriptionText.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -Constants.constraintDistance),
            descriptionText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.constraintDistance),
            //descriptionText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.constraintDistance),
            
            // MARK: stepLabel constraints
            stepLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: Constants.constraintDistance),
            stepLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -Constants.constraintDistance),
            stepLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: Constants.constraintDistance),
            stepLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -Constants.largeInset)
        ])
    }
}
