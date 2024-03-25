//
//  ZodiacSignsController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 07.02.24.
//

import UIKit
import SnapKit

class ZodiacsController: UIViewController {
    
    // MARK:  Properties
    
    let viewModel = ZodiacsAndYearsViewModel()
    
    // MARK: - UI Elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "zodiacDetailBackground")
        image.frame = view.bounds
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
       // layout.itemSize = CGSize(width: (view.frame.size.width/3)-32, height: 165)
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-32, height: view.frame.size.height/4-64)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        // Set content inset to create space between the header view and the collection view
        collection.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
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
        
        view.backgroundColor = .clear
        
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         collectionView ].forEach(view.addSubview(_:))
        
        makeConstraints()
    }
    
    // MARK: - Setup View Model
    
    private func setupViewModel() {
        self.viewModel.getAllZodiacsAndYearsList()
        
        self.viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    // MARK: - Setup constraints
    
    private func makeConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
}

    // MARK: - Collection View Data Soruce methods

extension ZodiacsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.responseList?.data?.zodiacs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyImageCell.identifier, for: indexPath) as! OnlyImageCell
        if let zodiacs = self.viewModel.responseList?.data?.zodiacs?[indexPath.row] {
            cell.configureCell(data: zodiacs)
        }
        return cell
    }
}

    // MARK: - Collection View Data Soruce methods

extension ZodiacsController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // go to zodiac detail
        if let zodiacs = self.viewModel.responseList?.data?.zodiacs?[indexPath.row] {
            self.viewModel.coordinator?.goToZodiacAndYearDetailScreen(id: zodiacs.id ?? "", type: "zodiac")
        }
    }
}
