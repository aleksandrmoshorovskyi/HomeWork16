//
//  DetailViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var dataModel: MainItem!
    
    var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Details"
        
        titleLabel = UILabel(frame: CGRect(x: view.frame.width/2, y: 100, width: 100, height: 50))
        
        if let model = dataModel {
            titleLabel.text = "title \(model.num)"
        } else {
            titleLabel.text = "title ?"
        }
        
        view.addSubview(titleLabel)
    }
}

/*
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
 */
