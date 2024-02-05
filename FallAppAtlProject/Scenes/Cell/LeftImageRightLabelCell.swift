//
//  LeftImageRightLabelCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//
import UIKit
import SnapKit

class LeftImageRightLabelCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "LeftImageRightLabelCell"
    
    // MARK: - UI Elements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    private lazy var leftImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .clear
        image.layer.cornerRadius = 8
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 16)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var forecastLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 12)
        label.textColor = UIColor.theme(named: .text)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    // MARK: - Life Cycle
    
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
        addSubview(containerView)
        
        [blurEffectView,
         leftImage,
         titleLabel,
         subtitleLabel,
         forecastLabel].forEach(containerView.addSubview(_:))
        
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        
        // Add white border to containerView
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.theme(named: .main).cgColor
        
        makeConstraints()
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        blurEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        leftImage.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(96)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.leading.equalTo(leftImage.snp.trailing).offset(12)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(16)
            make.leading.equalTo(leftImage.snp.trailing).offset(12)
        }
        
        forecastLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottomMargin).offset(16)
            make.leading.equalTo(leftImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(24)
        }
    }
    
    func configureDailyPrediction (with prediction: PredictionModel?) {
        titleLabel.text = prediction?.title
        subtitleLabel.text = prediction?.today?.title
        forecastLabel.text = prediction?.today?.forecast
    }
    
    func configureMonthlyPrediction (with prediction: PredictionModel?) {
        titleLabel.text = prediction?.title
        subtitleLabel.text = prediction?.monthly?.title
        forecastLabel.text = prediction?.monthly?.forecast
    }
    
    func configureYearlyPrediction (with prediction: PredictionModel?) {
        titleLabel.text = prediction?.title
        subtitleLabel.text = prediction?.yearly?.title
        forecastLabel.text = prediction?.yearly?.forecast
    }
}
