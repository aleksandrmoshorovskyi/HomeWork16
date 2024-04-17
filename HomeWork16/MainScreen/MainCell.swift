//
//  MainCell.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    static let idintifier = "MainCell"
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.backgroundColor = .cyan
        label.center = contentView.center
        
        contentView.addSubview(label)
        
        return label
    }()
}
