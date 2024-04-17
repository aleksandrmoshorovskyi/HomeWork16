//
//  OnboardingView.swift
//  HomeWork16
//
//  Created by Aleksandr Moroshovskyi on 17.04.2024.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    
}

class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    
    var collectionView: UICollectionView!
    var pageControl: UIPageControl!
    var goButton: UIButton!
    
    var goButtonActionCompletion: (() -> ())?
    
    @objc func goButtonClicked() {
        print("goButtonClicked")
        goButtonActionCompletion?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        // MARK: collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        
        // MARK: pageControl setup
        pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = 5
        //pageControl.backgroundColor = .black
        pageControl.layer.cornerRadius = 10
        
        // MARK: goButton setup
        goButton = UIButton()
        goButton.setTitle("go", for: .normal)
        goButton.setTitleColor(.black, for: .normal)
        goButton.setTitleColor(.gray, for: .highlighted)
        //goButton.layer.style.//stroke - ???
        goButton.layer.cornerRadius = 10
        goButton.addTarget(self, action: #selector(goButtonClicked), for: .touchUpInside)
        
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(goButton)
    }
    
    func autoresizingMaskOff() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        
        autoresizingMaskOff()
        
        NSLayoutConstraint.activate([
            // MARK: collectionView constraints
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            //collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            
            // MARK: pageControl constraints
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Constants.constraintDistance),
            pageControl.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120)
            
            // MARK: goButton constraints
            goButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: Constants.constraintDistance),
            goButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            goButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            goButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
        ])
    }
}

/*
 class CustomView: UIView {

     var customParam: customType
     
     var container = UIView()
     
     required init(customParamArg: customType) {
         self.customParam = customParamArg
         super.init(frame: .zero)
         // Setting up the view can be done here
         setupView()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     

     func setupView() {
         // Can do the setup of the view, including adding subviews

         setupConstraints()
     }
     
     func setupConstraints() {
         // setup custom constraints as you wish
     }
     
     
 }
 */

/*
 import UIKit

 class WelcomeViewController: UIViewController {

     var stackView: UIStackView!
     
     var signInBtn: UIButton!
     var signUpBtn: UIButton!
     var skipBtn: UIButton!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         view.backgroundColor = .systemGray
         navigationItem.title = "Welcome"
         
         setUI()
         
         //для спадкування
         addAllSubview()
         setConstraints()
     }
     
     func setUI() {
         
         // MARK: - signInBtn config
         signInBtn = UIButton()
         //signInBtn.frame.size = CGSize(width: 150, height: 50)
         signInBtn.setTitle("SignIn", for: .normal)
         
         // MARK: - signUpBtn config
         signUpBtn = UIButton()
         //signUpBtn.frame.size = CGSize(width: 150, height: 50)
         signUpBtn.setTitle("SignUp", for: .normal)

         // MARK: - skipBtn config
         skipBtn = UIButton()
         //skipBtn.frame.size = CGSize(width: 150, height: 50)
         skipBtn.setTitle("Skip", for: .normal)
         
         // MARK: - addTargets
         signInBtn.addTarget(self, action: #selector(signInBtnClicked), for: .touchUpInside)
         signUpBtn.addTarget(self, action: #selector(signUpBtnClicked), for: .touchUpInside)
         skipBtn.addTarget(self, action: #selector(skipBtnClicked), for: .touchUpInside)
         
         // MARK: - stackView config
         stackView = UIStackView()
         stackView.axis = NSLayoutConstraint.Axis.vertical
         stackView.spacing = 30
         
         view.addSubview(stackView)
     }
     
     //для спадкування
     func addAllSubview() {
         stackView.addArrangedSubview(signInBtn)
         stackView.addArrangedSubview(signUpBtn)
         stackView.addArrangedSubview(skipBtn)
         
         view.addSubview(stackView)
     }
     
     func setConstraints() {
         
         stackView.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
             // MARK: - stackView
             stackView.centerXAnchor.constraint(
                 equalTo: view.centerXAnchor
             ),
             stackView.centerYAnchor.constraint(
                 equalTo: view.centerYAnchor
             )
         ])
     }
     
     @objc func signInBtnClicked() {
         
         print("signInBtnClicked")
         
         if let navigationController = navigationController {
             navigationController.setViewControllers([SignInViewController()], animated: true)
         }
     }
     
     @objc func signUpBtnClicked() {
         
         print("signUpBtnClicked")
         
         if let navigationController = navigationController {
             navigationController.setViewControllers([SignUpViewController()], animated: true)
         }
     }
     
     @objc func skipBtnClicked() {
         
         print("skipBtnClicked")
         
         if let navigationController = navigationController {
             navigationController.setViewControllers([MainTabbarViewController()], animated: true)
         }
     }
 }

 */
