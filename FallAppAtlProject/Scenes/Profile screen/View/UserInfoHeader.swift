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
        return image
    }()
    
    private lazy var birthdayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .main
       // label.text = "October 25 2001 01:45"
        return label
    }()

    private lazy var zodiacSignLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .main
       // label.text = "Scorpio"
        return label
    }()
    
    private lazy var yearSignLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .main
      //  label.text = "Rabbit"
        return label
    }()
    
    private lazy var ascendingSign: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .main
       // label.text = "Libra"
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .main
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
            make.top.equalTo(birthdayLabel.snp.bottom).offset(10)
            make.leading.equalTo(image.snp.trailing).offset(24)
        }
        
        ascendingSign.snp.makeConstraints { make in
            make.top.equalTo(zodiacSignLabel.snp.bottom).offset(10)
            make.leading.equalTo(image.snp.trailing).offset(24)
        }
        
        yearSignLabel.snp.makeConstraints { make in
            make.top.equalTo(ascendingSign.snp.bottom).offset(10)
            make.leading.equalTo(image.snp.trailing).offset(24)
        }
    }
    
    // MARK: - Configure Header function
    
    func configureHeader(data: Profile) {
        self.birthdayLabel.text = data.birthDate
        self.zodiacSignLabel.text = "Zodiac sign - \(data.zodiacSign ?? "")"
        self.ascendingSign.text = "Ascendant sign - \(data.ascendingSign ?? "")"
        self.yearSignLabel.text = "Year sign - \(data.animalYear ?? "")"
    }
}
