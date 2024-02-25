//
//  SettingsCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import UIKit

class SettingsCell: UITableViewCell {
    static let identifier = "SettingsCell"
    
    // MARK: - UI Elements
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let optionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .main
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        
        optionLabel.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                                   y: 0,
                                   width: contentView.frame.size.width-20-iconContainer.frame.size.width,
                                   height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        optionLabel.text = nil
        iconContainer.backgroundColor = nil
    }
    
    private func setupUI() {
        iconContainer.addSubview(iconImageView)
        
        [optionLabel,
         iconContainer].forEach(contentView.addSubview)
        
        contentView.clipsToBounds = true
        
        accessoryType = .disclosureIndicator
    }
    
     func configureCell(data: SettingsOptions) {
        optionLabel.text = data.title
         iconImageView.image = data.icon.icon
         iconContainer.backgroundColor = data.iconBackgroundColor.color
    }
}
