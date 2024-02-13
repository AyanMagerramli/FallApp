//
//  ZodiacSignsMatchingController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import UIKit
import SnapKit

class ZodiacSignsMatchingListController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: ZodiacSignsMatchingListViewModel
    private var selectedIndexPaths: [String] = []
    private let maxCellSelectionLimit = 2
    
    // MARK: - Init
    
    init(viewModel: ZodiacSignsMatchingListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        buttonAction()
    }
    
    // MARK: - UI Elements
    
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
        layout.itemSize = CGSize(width: (view.frame.size.width/4)-12, height: 120)
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 6
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        // Set content inset to create space between the header view and the collection view
        collection.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.allowsSelection = true
        collection.isUserInteractionEnabled = true
        collection.register(OnlyImageCell.self, forCellWithReuseIdentifier: OnlyImageCell.identifier)
        collection.register(ZodiacSignsMatchingListHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ZodiacSignsMatchingListHeader.identifier)
        return collection
    }()
    
    private lazy var showResultButton = ReusableButton(title: "Show result")
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         collectionView,
         showResultButton].forEach(view.addSubview(_:))
        
        makeConstraints()
    }
    
    private func buttonAction() {
        showResultButton.buttonTappedHandler = { [weak self] in
            self?.viewModel.coordinator.goToMatchingResultScreen(body:  self?.viewModel.matchingResultBody ?? MatchingResultBodyModel())
        }
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.top.equalToSuperview().inset(4)
            make.bottom.equalTo(showResultButton.snp.top).offset(12)
        }
        
        showResultButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(90)
        }
    }
    
    // MARK: - Setup View Model
    
    private func setupViewModel() {
        viewModel.getMatchingList()
        
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

    // MARK: - Data Source methods

extension ZodiacSignsMatchingListController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.responseData?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyImageCell.identifier, for: indexPath) as! OnlyImageCell
        if let data = self.viewModel.responseData?.data?[indexPath.row] {
            cell.configureCell(data: data)
        }
        return cell
    }
}

    // MARK: - Delegate methods

extension ZodiacSignsMatchingListController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell =  collectionView.cellForItem(at: indexPath) as? OnlyImageCell else {
            return
        }
        // implementation of limit in selection cell count
        if let data = self.viewModel.responseData?.data?[indexPath.row] {
            if selectedIndexPaths.count < maxCellSelectionLimit {
                cell.isSelected = true
                selectedIndexPaths.append(data.id ?? "")
                self.viewModel.matchingResultBody = MatchingResultBodyModel()
                self.viewModel.matchingResultBody?.firstZodiacID = selectedIndexPaths.first
                self.viewModel.matchingResultBody?.secondZodiacID = selectedIndexPaths.last
                print("matchingResultBody \(self.viewModel.matchingResultBody)")
                DispatchQueue.main.async {
                    cell.changeCellImage()
                }
                print("ARRAY is \(selectedIndexPaths)")
            } else if let index = selectedIndexPaths.firstIndex(of: data.id ?? "") {
                DispatchQueue.main.async {
                    if let data = self.viewModel.responseData?.data?[indexPath.row] {
                        cell.configureCell(data: data)
                    }
                }
                cell.contentView.backgroundColor = .clear
                selectedIndexPaths.remove(at: index)
                print("ARRAY decrease is \(selectedIndexPaths)")
            }
        }
    }
    
    // Size for header view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // Return the size of your header view
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ZodiacSignsMatchingListHeader.identifier, for: indexPath) as! ZodiacSignsMatchingListHeader
            
            return headerView
        }
        return UICollectionReusableView()
    }
}
