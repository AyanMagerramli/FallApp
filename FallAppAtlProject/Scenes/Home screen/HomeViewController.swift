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
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        customizeBackButton()
        
        view.addSubview(backgroundImage)
        // Send the image view to the back so other UI elements are on top
        view.sendSubviewToBack(backgroundImage)
        
        view.backgroundColor = .clear
        
        view.addSubview(collectionView)
        
       title = "Hello, there"
        
        makeConstraints()
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
    
    }
}

    // MARK: - Colelction View Data Source methods

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftImageRightLabelCell.identifier, for: indexPath) as! LeftImageRightLabelCell
        cell.configureUI()
      //  cell.layer.cornerRadius = 12
        return cell
    }
}

// MARK: - Colelction View Delegate methods

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //go to detail page
        let vc = TarotViewController()
        navigationController?.show(vc, sender: nil)
    }
}
