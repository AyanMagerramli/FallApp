//
//  ZodiacSignsMatchingListHeader.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import UIKit

class ZodiacSignsMatchingListHeader: UICollectionReusableView {
    
    // MARK: Properties
    
    static let identifier = "ZodiacSignsMatchingListHeader"
    
    // MARK: -UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Wanna learn how suitable you are?"
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
        label.text = "Choose your own and your partner's zodiac sign in order to see your  matching level"
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
        backgroundColor = .clear
        
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
}
