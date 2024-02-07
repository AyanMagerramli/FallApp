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
    
    // MARK: - Configure cell function for Home Detail Screen
    
    func configureDailyPrediction (with prediction: PredictionModel?) {
        titleLabel.text = prediction?.today?.title
        infoDetailLabel.text = prediction?.today?.forecast
        image.image = UIImage(named: "DailyPrediction")
       // image.loadImage(url: prediction?.today?.zodiacImage ?? "no image")
    }
    
    func configureMonthlyPrediction (with prediction: PredictionModel?) {
        titleLabel.text = prediction?.monthly?.title
        infoDetailLabel.text = prediction?.monthly?.forecast
        image.image = UIImage(named: "MonthlyPrediction")
       // image.loadImage(url: prediction?.monthly?.zodiacImage ?? "no image")
    }
    
    func configureYearlyPrediction (with prediction: PredictionModel?) {
        titleLabel.text = prediction?.yearly?.title
        infoDetailLabel.text = prediction?.yearly?.forecast
        image.image = UIImage(named: "YearlyPrediction")
      //  image.loadImage(url: prediction?.yearly?.zodiacImage ?? "no image")
    }
    
    // MARK: - Configure cell function for Tarot Detail Screen
    
    func configureTarotDetailCell(data: TarotDetailResponseModel) {
        titleLabel.text = "Interesting... What does this card mean?"
        infoDetailLabel.text = data.data?.card?.generalInfo
        image.loadImage(url: data.data?.card?.backImage ?? "no image")
    }
}

