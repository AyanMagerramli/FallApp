//
//  OnlyImageCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 22.01.24.
//

import UIKit

class OnlyImageCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "OnlyImageCell"
    
    // MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
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
    
    // MARK: - Configure function
    
    func configureCell() {
        image.image = UIImage(named: "cellDummyImage")
    }
}
