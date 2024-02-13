//
//  MatchingResultCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 13.02.24.
//

import UIKit
import SnapKit

class MatchingResultCell: UITableViewCell {
    
    // MARK: Elements
    
    static let identifier = "MatchingResultCell"
    
    // MARK: - UI elements
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "zodiacMatchBanner")
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    
    private let resultLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.font = .robotoFont(ofType: .regular, size: 14)
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        
        [image,
         resultLabel].forEach(contentView.addSubview(_:))
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        image.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview()
            make.height.equalTo(200)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalTo(image.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Configure cell method
    
    func configureCell(data: MatchingData) {
        self.resultLabel.text = data.message
    }
}
