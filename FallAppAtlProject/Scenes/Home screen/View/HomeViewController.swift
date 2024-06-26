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
    
    let viewModel = HomeViewModel()
    
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
        collection.register(OnlyImageCell.self, forCellWithReuseIdentifier: OnlyImageCell.identifier)
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
        setupNavigationBarButtons()
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
    
    func didTarotSuccess() {
        self.viewModel.tarotSuccess = { [weak self] in
            
            }
        }
    
    
    // MARK: - Navigation bar buttons setup
    
    private func setupNavigationBarButtons() {
        // Create a UIBarButtonItem
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "person.fill"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(leftButtonTapped))
        
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc
    private func leftButtonTapped() {
        // Handle left button tap -> go to Profile screen
        self.viewModel.coordinator?.navigate(to: .profile)
    }
}

    // MARK: - Colelction View Data Source methods

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        let leftImageRightLabelCell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftImageRightLabelCell.identifier, for: indexPath) as! LeftImageRightLabelCell
        
        cell = leftImageRightLabelCell
        
        let tag = indexPath.section
        cell.tag = tag
        
        switch indexPath.section {
            
        case 0:
            let matchingCell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyImageCell.identifier, for: indexPath) as! OnlyImageCell
            cell = matchingCell
            matchingCell.setupMatchingPicture()
            
        case 1:
            let tarotCell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyImageCell.identifier, for: indexPath) as! OnlyImageCell
            cell = tarotCell
            tarotCell.setupTarotCell()
            
        case 2:
            if let title = self.viewModel.userPredictions?.data,
               let data = self.viewModel.userPredictions?.data?.today {
                leftImageRightLabelCell.configureCell(title: title, data: data)
            }
            
        case 3:
            if let title = self.viewModel.userPredictions?.data,
               let data = self.viewModel.userPredictions?.data?.monthly {
                leftImageRightLabelCell.configureCell(title: title, data: data)
            }
            
        case 4:
            if let title = self.viewModel.userPredictions?.data,
               let data = self.viewModel.userPredictions?.data?.yearly {
                leftImageRightLabelCell.configureCell(title: title, data: data)
            }
            
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
        if indexPath.section == 0 {
            self.viewModel.coordinator?.navigate(to: .matchingList) // Go to matching signs list screen
        } else if indexPath.section == 1 {
            self.viewModel.didUserChooseTarot()
            didTarotSuccess()
            if self.viewModel.alreadySelected == true {
                self.viewModel.coordinator?.goToUserSelectedCardScreen()
            } else if self.viewModel.alreadySelected == false {
                self.viewModel.coordinator?.goToTarotSelectionScreen()
            }
        } else {
            viewModel.coordinator?.goToHomeDetailScreen(tag: selectedTag) // Go to prediction detail page
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 24, bottom: 0, right: 24)
    }
}
