//
//  ZodiacAndYearSignAboutCell.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit

class ZodiacAndYearSignAboutCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "ZodiacAndYearSignAboutCell"

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

    private lazy var topImage: UIImageView = {
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

    private lazy var textLabell: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 12)
        label.textColor = UIColor.theme(named: .text)
        label.lineBreakMode = .byWordWrapping
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
    
    // MARK: - Setup UI

    private func setupUI() {
        addSubview(containerView)
        
        [blurEffectView,
         topImage,
         titleLabel,
         textLabell].forEach(containerView.addSubview(_:))
        
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

        topImage.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(12)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topImage.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
        }

        textLabell.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(12)
        }
    }

    func configureCell(data: Items?, title: String) {
        topImage.loadImage(url: data?.image ?? "no image")
        titleLabel.text = title
        textLabell.text = data?.text
    }
}
