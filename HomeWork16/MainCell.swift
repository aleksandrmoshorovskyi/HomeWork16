//
//  MainCell.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        
        contentView.backgroundColor = .cyan
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        /*
         yourView.translatesAutoresizingMaskIntoConstraints = false
         */
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
