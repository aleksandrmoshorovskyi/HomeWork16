//
//  DetailViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class DetailsViewController: BaseViewController {
    
    var dataModel: MainModel!
    var contentView: DetailsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Details"
        navigationItem.style = .editor
        
        setupInitialState()
        
        if let model = dataModel {
            contentView.titleLabel.text = "title \(model.num)"
            contentView.backgroundColor = UIColor.getColorFor(RGB: model.rgb)
        } else {
            contentView.titleLabel.text = "title ?"
        }
        
        contentView.adaptForContent()
    }
    
    func setupInitialState() {
        
        contentView = DetailsView(frame: view.frame)
        contentView.delegate = self
        
        view.addSubview(contentView)
        
        setupConstraints(for: contentView)
    }
}
