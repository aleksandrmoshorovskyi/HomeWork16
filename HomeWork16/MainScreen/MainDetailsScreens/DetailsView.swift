//
//  DetailsView.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 19.04.2024.
//

import UIKit

protocol DetailsViewDelegate: AnyObject {
    
}

class DetailsView: UIView {
   
    weak var delegate: DetailsViewDelegate?
    
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        // MARK: titleLabel setup
        titleLabel = UILabel()
        titleLabel.textAlignment = Constants.textAlignment
        titleLabel.font = Constants.font
        
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(titleLabel)
    }
    
    func autoresizingMaskOff() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        autoresizingMaskOff()
        
        NSLayoutConstraint.activate([
            // MARK: titleLabel constraints
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.constraintDistance),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: .zero)
        ])
    }
    
    func adaptForContent() {
        
        if let backgroundColor = self.backgroundColor {
            titleLabel.textColor = backgroundColor.isLight() ? .black : .white
        }
    }
}
