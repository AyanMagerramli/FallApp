//
//  NewsController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import UIKit

class NewsController: UIViewController {
    
    // MARK: Properties
    
     let viewModel = NewsViewModel()
    
    // MARK: - UI Views
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage (named: "backgroundImage")
        image.contentMode = .scaleAspectFill
        image.frame = view.bounds
        return image
    }()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        layout.itemSize = CGSize(width: (view.frame.size.width)-48, height: 196)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(LeftImageRightTitleCell.self, forCellWithReuseIdentifier: LeftImageRightTitleCell.identifier)
        collection.backgroundColor = .clear
        collection.frame = view.bounds
        return collection
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    private func setupUI() {
        customizeBackButton()
    
        title = "Horoscope News"
        
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         collectionView].forEach(view.addSubview)
    }
    
    // MARK: - View Model setup
    
    private func setupViewModel() {
        self.viewModel.getNewsList()
        
        self.viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

    // MARK: - Collection View Data Source methods

extension NewsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.newsList?.data?.news?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeftImageRightTitleCell.identifier, for: indexPath) as! LeftImageRightTitleCell
        if let news = self.viewModel.newsList?.data?.news?[indexPath.row] {
            cell.configureCell(data: news)
        }
        return cell
    }
}

    // MARK: - Collection View Delegate methods

extension NewsController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedItem = self.viewModel.newsList?.data?.news?[indexPath.item] {
            self.viewModel.coordinator?.goToNewsDetailScreen(selectedItem: selectedItem)
        }
    }
}
