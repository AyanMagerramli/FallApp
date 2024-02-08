//
//  DetailCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit
import SnapKit

protocol DetailCellProtocol {
    var titleText: String { get }
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
        contentView.backgroundColor = .clear
        
        [image,
         titleLabel,
         infoDetailLabel].forEach(contentView.addSubview(_:))
        
        makeConstraints()
    }
    
    //MARK: - Setup constraints
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        image.snp.makeConstraints { make in
            make.height.equalTo(310)
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
    
    func configureCell (data: DetailCellProtocol) {
        self.titleLabel.text = data.titleText
        self.infoDetailLabel.text = data.infoText
        self.image.loadImage(url: data.astroImage)
    }
}

