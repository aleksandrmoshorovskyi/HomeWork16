//
//  DetailViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var dataModel: MainDataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Details"
        
        if let model = dataModel {
            titleLabel.text = "title \(model.num)"
        } else {
            titleLabel.text = "title ?"
        }
    }
}
