//
//  OnboardingFlowViewController.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 15.04.2024.
//

import UIKit

class Instruction {
    
    var title: String
    var detailText: String
    var step: Int
    
    init(title: String, detailText: String, step: Int) {
        self.title = title
        self.detailText = detailText
        self.step = step
    }
}

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var goButton: UIButton!
    
    @IBAction func goButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        //navigationController?.pushViewController(vc, animated: true)
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    private var onboardingDataSourceOnboarding: [Instruction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingDataSourceOnboarding = [
            Instruction(title: "Title 1", detailText: "description 1", step: 1),
            Instruction(title: "Title 2", detailText: "description 2", step: 2),
            Instruction(title: "Title 3", detailText: "description 3", step: 3),
            Instruction(title: "Title 4", detailText: "description 4", step: 4),
            Instruction(title: "Title 5", detailText: "description 5", step: 5)
        ]
        
        collectionView.backgroundColor = .yellow
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageControl.numberOfPages = onboardingDataSourceOnboarding.count
        pageControl.currentPage = 0
        
        goButton.isHidden = true
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    
    //переробити на інший метод
    /*
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        pageControl.currentPage = indexPath.row

        if (indexPath.row == 4) {
            print("last")
            goButton.isHidden = false
        } else {
            goButton.isHidden = true
        }
    }
     */
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //print("scrollViewDidEndDecelerating")
        
        //let scrollPosition = scrollView.contentOffset.x / view.frame.width
        let scrollPosition = scrollView.contentOffset.x / scrollView.bounds.width
        
        pageControl.currentPage = Int(round(scrollPosition))
        
        if (scrollPosition == 4) {
            //print("last")
            goButton.isHidden = false
        } else {
            goButton.isHidden = true
        }
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return onboardingDataSourceOnboarding.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        cell.titleLabel.text = onboardingDataSourceOnboarding[indexPath.row].title
        cell.detailLable.text = onboardingDataSourceOnboarding[indexPath.row].detailText
        cell.stepLable.text = "STEP \(onboardingDataSourceOnboarding[indexPath.row].step)"
        
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
}

/*
 func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
     let scrollPosition = scrollView.contentOffset.x / view.frame.width
     pageIndicator.currentPage = Int( round(scrollPosition) )
 }
 */
