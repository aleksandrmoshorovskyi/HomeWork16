//
//  MainViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private var dataSource: [MainDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        //print("MainViewController")
        
        for i in 1...90 {
            dataSource.append(MainDataModel(num: i))
        }
    }
}

// MARK: MainViewController - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
         [tableView deselectRowAtIndexPath:indexPath animated:YES];
         
         EmailedDetailedController *emailedDetailedController = [[EmailedDetailedController alloc] initWithNibName:@"EmailedDetailedController" bundle:nil];
         emailedDetailedController.model = dataSource[indexPath.row];
         [self.navigationController pushViewController:emailedDetailedController animated:YES];
         */
        
        //print("\(dataSource[indexPath.row].num)")
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        if let vc = detailViewController {
            vc.dataModel = dataSource[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: MainViewController - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as? MainCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        cell.titleLable.text = "\(dataSource[indexPath.row].num)"
        
        return cell
    }
}

// MARK: MainViewController - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return collectionView.bounds.size
        return CGSize(width: collectionView.bounds.width/3.0, height: collectionView.bounds.width/3.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
}
