//
//  UserInfoCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit
import SnapKit

class UserInfoCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "UserInfoCell"
    
    //MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.layer.cornerRadius = 12
        return image
    }()
    
    private lazy var birthdayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()

    private lazy var zodiacSignLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private lazy var yearSignLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    // MARK: - Life cycle

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
    
    // MARK: - UI setup
    
    private func setupUI() {
        contentView.backgroundColor = .clear
        
        contentView.addSubview(image)
        contentView.addSubview(birthdayLabel)
        contentView.addSubview(yearSignLabel)
        contentView.addSubview(zodiacSignLabel)
        
        makeConstraints()
    }
    
    // MARK: - Setup constraints
    
    private func makeConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        birthdayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(24)
        }
        
        zodiacSignLabel.snp.makeConstraints { make in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(8)
            make.leading.equalTo(image.snp.trailing).offset(24)
        }
        
        yearSignLabel.snp.makeConstraints { make in
            make.top.equalTo(zodiacSignLabel.snp.bottom).offset(8)
            make.leading.equalTo(image.snp.trailing).offset(24)
        }
    }
}
