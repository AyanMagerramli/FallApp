//
//  CustomHeaderView.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.01.24.
//

import UIKit
import SnapKit

class CustomHeaderView: UICollectionReusableView {
    
    // MARK: Properties
    
    static let identifier = "CustomHeaderView"
    
    // MARK: -UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
     //   label.text = "What is your Date of Birth?"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
      //  label.text = "Вы можете сделать выбор иллюстраций карт Таро. Выбирайте то, что нравится, это поможет глубже разобрать вашу ситуацию"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .medium, size: 16)
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    // MARK: - Life cycle
    
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
        backgroundColor = UIColor.theme(named: .background)
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        makeConstraints()
    }
    
    // MARK: - Setup constraints
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview()
        }
    }
        
    // MARK: - Configure Header for Tarot List screen
    
    func configureHeader(data: UserInfoData?) {
        self.titleLabel.text = data?.title
        self.subtitleLabel.text = data?.subtitle
    }
}
