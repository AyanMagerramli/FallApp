//
//  TarotSelectionController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.02.24.
//

import UIKit
import SnapKit

class TarotSelectionController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: TarotSelectionViewModel
    
    // MARK: - Init
    
    init(viewModel: TarotSelectionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Wanna know your lucky card?"
        label.font = .robotoFont(ofType: .bold, size: 24)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .main
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose any card from the list and learn your what waits for you..."
        label.font = .robotoFont(ofType: .medium, size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .main
        return label
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (view.frame.size.width), height: (view.frame.size.height)/2+100)
        layout.minimumInteritemSpacing = 12
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.dataSource = self
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        collection.delegate = self
        collection.register(OnlyImageCell.self, forCellWithReuseIdentifier: OnlyImageCell.identifier)
        return collection
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .main
        pageControl.pageIndicatorTintColor = .white
        return pageControl
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.frame = view.bounds
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "zodiacDetailBackground")
        return image
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.sendSubviewToBack(backgroundImage)
        view.backgroundColor = .background

        [backgroundImage,
         titleLabel,
         subtitleLabel,
         collectionView,
         pageControl].forEach(view.addSubview)
        
        makeConstraints()
    }
    
    // MARK: Setup Constraints
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()/*.inset(24)*/
            make.bottom.equalToSuperview()
            make.top.equalTo(subtitleLabel.snp.bottom).offset(12)
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(12)
            make.bottom.equalToSuperview().inset(36)
        }
    }
    
    // MARK: - Setup view model
    
    private func setupViewModel() {
        viewModel.getAllTarots()
        
        viewModel.success = { [weak self] in
            self?.collectionView.reloadData()
            self?.updatePageControl()
        }
    }
    
    private func updatePageControl() {
           guard let count = viewModel.tarotList?.data?.cards?.count else {
               return
           }
           pageControl.numberOfPages = count
       }
}

    //MARK: - Collection view Data source

extension TarotSelectionController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.tarotList?.data?.cards?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnlyImageCell.identifier, for: indexPath) as! OnlyImageCell
        cell.setupTarotSelectionCell()
        return cell
    }
}

    //MARK: - Collection view Delegate

extension TarotSelectionController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.viewModel.didUserSelectTarot == false {
            if let id = viewModel.tarotList?.data?.cards?[indexPath.row].id {
                self.viewModel.coordinator.goToSelectedTarotDetailScreen(tarotId: id)
                self.viewModel.didUserSelectTarot = true
            }
        } else {
            collectionView.deselectItem(at: indexPath, animated: false)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = currentPage
    }
}
