//
//  OnlyImageCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 22.01.24.
//

import UIKit

protocol OnlyImageCellProtocol {
    var imagee: String { get }
}

class OnlyImageCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "OnlyImageCell"
    
    // MARK: - UI Elements
    
     lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.image = UIImage(named: "cellDummyImage")
        image.layer.cornerRadius = 8
        image.frame = contentView.bounds
        return image
    }()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        addSubview(image)
        contentView.layer.cornerRadius = 8
    }
    
    // MARK: - Configure cell method

    func configureCell (data: OnlyImageCellProtocol) {
        image.loadImage(url: data.imagee)
    }
    
    // for Home Screen Matching banner
    
    func setupPicture() {
        image.image = UIImage(named: "matchingResult")
    }
    
    // fro matching selection
    
    func changeCellImage() {
        image.image = UIImage(named: "matchingSelectionImage")
    }
}
