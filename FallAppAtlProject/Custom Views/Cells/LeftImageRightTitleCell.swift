//
//  LeftImageRightTitleCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import UIKit
import SnapKit

protocol LeftImageRightTitleCellProtocol {
    var titleText: String { get }
    var imageURL: String { get }
}

class LeftImageRightTitleCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "LeftImageRightTitleCell"
    
    // MARK: - UI Elements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    private lazy var leftImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.layer.cornerRadius = 8
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.text = "Click and get detailed information in order to know zodiac signs much better."
        return label
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
        addSubview(containerView)
        
        [blurEffectView,
         leftImage,
         titleLabel,
         subtitleLabel].forEach(containerView.addSubview(_:))
        
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        
        // Add white border to containerView
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.theme(named: .main).cgColor
        
        makeConstraints()
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        blurEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        leftImage.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(96)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalTo(leftImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(12)
            make.leading.equalTo(leftImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
        }
    }
    
    func configureCell(data: LeftImageRightTitleCellProtocol) {
        leftImage.loadImage(url: data.imageURL)
        titleLabel.text = data.titleText
    }
}
