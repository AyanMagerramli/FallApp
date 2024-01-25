//
//  DetailCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit
import SnapKit

class DetailCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "DetailCell"
    
    //MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.layer.cornerRadius = 12
        image.frame = contentView.bounds
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()

    private lazy var infoDetailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 14)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    //MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        contentView.backgroundColor = UIColor.theme(named: .background)
    
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoDetailLabel)
        
        makeConstraints()
    }
    
    //MARK: - Setup constraints
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(245)
            make.width.equalTo(200)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        infoDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    // MARK: - Configure cell function
    
    func configureCell() {
        image.image = UIImage(named: "cellDummyImage")
        titleLabel.text = "Tarot card name"
        infoDetailLabel.text = "The pack to which these cards were added naturally bore Italian suitmarks and belonged to an experimental period of card design when queens were often added to the series of court cards previously consisting of only a king and two male figures (see playing card). In standard cards (but not in tarots), the four figures were subsequently reduced to three again by suppression of the queen, except in French cards, which suppressed the cavalier (knight).The pack to which these cards were added naturally bore Italian suitmarks and belonged to an experimental period of card design when queens were often added to the series of court cards previously consisting of only a king and two male figures (see playing card). In standard cards (but not in tarots), the four figures were subsequently reduced to three again by suppression of the queen, except in French cards, which suppressed the cavalier (knight).The pack to which these cards were added naturally bore Italian suitmarks and belonged to an experimental period of card design when queens were often added to the series of court cards previously consisting of only a king and two male figures (see playing card). In standard cards (but not in tarots), the four figures were subsequently reduced to three again by suppression of the queen, except in French cards, which suppressed the cavalier (knight).The pack to which these cards were added naturally bore Italian suitmarks and belonged to an experimental period of card design when queens were often added to the series of court cards previously consisting of only a king and two male figures (see playing card). In standard cards (but not in tarots), the four figures were subsequently reduced to three again by suppression of the queen, except in French cards, which suppressed the cavalier (knight)."
    }
}

