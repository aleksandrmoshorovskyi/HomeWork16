//
//  OnboardingViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

/*
 class MainPlaylistViewController: UIViewController {
     
     @IBOutlet weak var contentView: MainPlaylistView!
     var model: MainPlaylistModel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         setupInitialState()
         model.loadData()
     }
     
     private func setupInitialState() {
         
         model = MainPlaylistModel()
         model.delegate = self
         
         contentView.delegate = self
         
         contentView.tableView.dataSource = self
         contentView.tableView.delegate = self
     }
 */

import UIKit

class OnboardingViewController: UIViewController {
    
    var model: OnboardingModel!
    var contentView: OnboardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = OnboardingModel()
        model.delegate = self
        
        contentView = OnboardingView(frame: view.frame)
        contentView.delegate = self
        
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        
        view.addSubview(contentView)
        setupConstraints()
        
        /*
        contentView.tableView.register(
             FavoriteTableViewCell.self,
             forCellReuseIdentifier: FavoriteTableViewCell.idintifier)
         */
        contentView.collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.idintifier)
        
        contentView.goButtonActionCompletion = { [weak self] in
            print("contentView.goButtonActionCompletion")
            self?.navigationController?.setViewControllers([MainViewController()], animated: true)
        }
        
        /*
        cell.favoriteButtonActionCompletion = { [weak self, cell] in
            guard let self = self else { return }
            
            let isFavorite = !model.pcItems[indexPath.row].favorite()
            model.updateItem(with: isFavorite, at: indexPath.row)
  
            cell.favoriteButton.setTitle(isFavorite ? "💙" : "🤍", for: .normal)
            cell.favoriteButton.setTitle(isFavorite ? "💙" : "🤍", for: .selected)
        }
         */
    }
    
    private func setupConstraints() {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // MARK: - contentView Constraints
            contentView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: .zero
            ),
            contentView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: .zero
            ),
            contentView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: .zero
            ),
            contentView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: .zero
            )
        ])
    }
}

extension OnboardingViewController: OnboardingModelDelegate {
    
    func dataDidLoad() {
        //reloadData()
        contentView.collectionView.reloadData()
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    
}


/*
 import UIKit

 class SampleViewController: UIViewController {
     
     @IBOutlet weak var contentView: SampleView!
     
     var model: SampleModel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         setupInitialState()
     }
     
     private func setupInitialState() {
         model = SampleModel()
         model.loadData()
         
         model.delegate = self
         
         contentView.delegate = self
         contentView.tableView.dataSource = self
         contentView.tableView.delegate = self
         
         //реєстрація комірки реалізованої в коді
         contentView.tableView.register(
             SampleTableViewCell.self,
             forCellReuseIdentifier: SampleTableViewCell.idintifier)
         
         //реєстрація комірки, що у xib-файлі
         let nib = UINib(nibName: "SampleNibTableViewCell", bundle: nil)
         contentView.tableView.register(nib, forCellReuseIdentifier: "SampleNibTableViewCell")
     }
 }

 extension SampleViewController: SampleModelDelegate {
     
     func dataDidLoad() {
         //code
     }
 }

 extension SampleViewController: SampleViewDelegate {
     
 }
 */
