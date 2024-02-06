//
//  TarotViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 22.01.24.
//

import UIKit
import SnapKit

class TarotViewController: UIViewController {
    
    // MARK:  Properties
    
    var coordinator: MainCoordinator?
    var viewModel: TarotViewModel
    var tarotId: String?
    
    // MARK: - Init
    
    init(viewModel: TarotViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-32, height: 246)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        // Set content inset to create space between the header view and the collection view
        collection.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.register(OnlyImageCell.self, forCellWithReuseIdentifier: OnlyImageCell.identifier)
        collection.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.identifier)
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
        
        view.backgroundColor = UIColor.theme(named: .background)

        view.addSubview(collectionView)
        
        makeConstraints()
    }
    
    // MARK: - Setup View Model
    
    private func setupViewModel() {
        self.viewModel.loadTarotList()
        
        self.viewModel.success = {
            self.collectionView.reloadData()
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

extension TarotViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.responseData?.data?.cards?.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyImageCell.identifier, for: indexPath) as! OnlyImageCell
        guard let responseData = self.viewModel.responseData,
              let data = responseData.data,
              let cards = data.cards,
              indexPath.row < cards.count else {
            print("Invalid data or indexPath")
            return cell
        }
        
        let tarotData = cards[indexPath.row]
        cell.configureTarotListCell(data: tarotData)
        self.tarotId = tarotData.id
        return cell
    }
}

    // MARK: - Collection View Data Soruce methods

extension TarotViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let responseData = self.viewModel.responseData,
              let data = responseData.data,
              let cards = data.cards else {
                  print("Invalid data or indexPath")
                  return
              }
        let tarotData = cards[indexPath.row]
        self.tarotId = tarotData.id
        
        self.viewModel.coordinator.goToTarotDetail(tarotId: tarotId ?? "")
    }
    
    // Size for header view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Return the size of your header view
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderView.identifier, for: indexPath) as! CustomHeaderView
            
            headerView.configureHeader(data: self.viewModel.responseData?.data)
            
            return headerView
        }
        return UICollectionReusableView()
    }
}
