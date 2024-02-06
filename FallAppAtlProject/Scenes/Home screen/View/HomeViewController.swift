//
//  HomeViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    private let viewModel = HomeViewModel()
    
    // MARK: UI Elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backgroundImage")
        image.contentMode = .scaleAspectFill
        image.frame = view.bounds
        return image
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width)-48, height: 196)
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 4
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.frame = view.bounds
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.register(LeftImageRightLabelCell.self, forCellWithReuseIdentifier: LeftImageRightLabelCell.identifier)
        return collection
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        customizeBackButton()
        
        [backgroundImage,
         collectionView].forEach(view.addSubview(_:))
        
        // Send the image view to the back so other UI elements are on top
        view.sendSubviewToBack(backgroundImage)
        
        view.backgroundColor = .clear
        
        makeConstraints()
    }
    
    private func setupViewModel() {
        self.viewModel.loadUserZodiacSignPredictions()
        self.viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
            self?.navigationItem.title = self?.viewModel.userPredictions?.data?.title
        }
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
    
    }
}

    // MARK: - Colelction View Data Source methods

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3 // Three sections for today, monthly, and yearly
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1  // One prediction row for each section
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftImageRightLabelCell.identifier, for: indexPath) as! LeftImageRightLabelCell
        
        let tag = indexPath.section
        cell.tag = tag
        
        switch indexPath.section {
            
        case 0:
            cell.configureDailyPrediction(with: self.viewModel.userPredictions?.data)
            
        case 1:
            cell.configureMonthlyPrediction(with: self.viewModel.userPredictions?.data)
            
        case 2:
            cell.configureYearlyPrediction(with: self.viewModel.userPredictions?.data)
            
        default:
           break
        }
        
        return cell
    }
}
// MARK: - Colelction View Delegate methods

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedTag = indexPath.section
        coordinator?.goToHomeDetailScreen(tag: selectedTag) //go to detail page
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24)
    }
}
