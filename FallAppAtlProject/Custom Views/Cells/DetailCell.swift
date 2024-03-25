//
//  DetailCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit
import SnapKit

protocol DetailCellProtocol {
    var titleTextForDetail: String { get }
    var infoText: String { get }
    var astroImage: String { get }
}

class DetailCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "DetailCell"
    
    //MARK: - UI Elements
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.layer.cornerRadius = 130
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.main.cgColor
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
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
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
        contentView.backgroundColor = .clear
        
        [image,
         titleLabel,
         containerView].forEach(contentView.addSubview)
        
        [blurEffectView,
         infoDetailLabel].forEach(containerView.addSubview)
        
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        
        // Add white border to containerView
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.theme(named: .main).cgColor
        
        makeConstraints()
    }
    
    //MARK: - Setup constraints
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(260)
            make.width.equalTo(260)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        blurEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        infoDetailLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.top.equalToSuperview().inset(12)
        }
    }
    
    // MARK: - Configure cell method
    
    func configureCell (data: DetailCellProtocol) {
        self.titleLabel.text = data.titleTextForDetail
        self.infoDetailLabel.text = data.infoText
        self.image.loadImage(url: data.astroImage)
    }
    
    // MARK: Configure already selected tarot screen
    
    func configureSelectedTarot (data:  StoredSelectedTarotInfo) {
        self.titleLabel.text = "You have already selected your daily Tarot!"
        self.infoDetailLabel.text = data.tarotInfo
        self.image.loadImage(url: data.tarotImage ?? "")
    }
}

