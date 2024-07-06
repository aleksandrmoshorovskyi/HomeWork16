//
//  MainCell.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    static let idintifier = "MainCell"
    
    lazy var backView: UIView = {
        
        let view = UIView()
        
        view.layer.cornerRadius = Constants.cornerRadius
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = Constants.textAlignment
        label.font = Constants.font
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    }
    
    func autoresizingMaskOff() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        autoresizingMaskOff()
        
        NSLayoutConstraint.activate([
            // MARK: backView constraints
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.inset),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.inset),
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.inset),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.inset),
            
            // MARK: titleLabel constraints
            titleLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
    
    func adaptForContent() {
        
        if let backgroundColor = backView.backgroundColor {
            titleLabel.textColor = backgroundColor.isLight() ? .black : .white
        }
    }
}
