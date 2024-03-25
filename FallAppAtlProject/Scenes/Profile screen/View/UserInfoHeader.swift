//
//  UserInfoHeader.swift
//  FallAppAtlProject
//
//  Created by Ayan on 10.02.24.
//

import UIKit

class UserInfoHeader: UITableViewHeaderFooterView {
    
    // MARK: Properties
    
    static let identifier = "UserInfoHeader"
    
    // MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.image = UIImage(named: "profileAvatar")
        image.layer.borderColor = UIColor.main.cgColor
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 2.0
        return image
    }()
    
    private lazy var birthdayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.main.cgColor
        label.layer.cornerRadius = 10
        return label
    }()

    private lazy var zodiacSignLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.main.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    private lazy var yearSignLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.main.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    private lazy var ascendingSign: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.main.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.main.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    // MARK: - Life cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI setup
    
    private func setupUI() {
        contentView.backgroundColor = .clear
        
        [image,
         birthdayLabel,
         yearSignLabel,
         zodiacSignLabel,
         ascendingSign].forEach(contentView.addSubview(_:))
        
        makeConstraints()
    }
    
    // MARK: - Setup constraints
    
    private func makeConstraints() {
        birthdayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(birthdayLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        zodiacSignLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top).offset(50)
            make.leading.equalToSuperview().inset(6)
        }
        
        ascendingSign.snp.makeConstraints { make in
            make.top.equalTo(image.snp.top).offset(50)
            make.trailing.equalToSuperview().inset(6)
        }
        
        yearSignLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Configure Header function
    
    func configureHeader(data: Profile) {
        self.birthdayLabel.text = data.birthDate
        self.zodiacSignLabel.text = "Zodiac: \(data.zodiacSign ?? "")"
        self.ascendingSign.text = "Ascn: \(data.ascendingSign ?? "")"
        self.yearSignLabel.text = "Year: \(data.animalYear ?? "")"
    }
}
