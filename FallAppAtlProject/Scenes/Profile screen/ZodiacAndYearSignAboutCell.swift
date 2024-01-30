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
         leftImage,
         titleLabel,
         subtitleLabel,
         textLabell].forEach(containerView.addSubview(_:))
        
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        
        // Add white border to containerView
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.theme(named: .main).cgColor
        
        makeConstraints()
        configureUI()
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

        textLabell.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottomMargin).offset(16)
            make.leading.equalTo(leftImage.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(24)
        }
    }

    func configureUI() {
        leftImage.image = UIImage(named: "cellDummyImage")
        titleLabel.text = "Your daily prediction"
        subtitleLabel.text = "Scorpio"
        textLabell.text = "You can bet there’s something juicy going on, under the wraps, though, because Scorpios like extremes, challenges, danger and darkness. They are, because of their planetary ruler Pluto, drawn to the outliers of human experience. If it’s kinky, risky or thrilling, a Scorpio will be involved somehow!Scorpios are loyal, smart, shrewd and stoic. They stand by their beliefs, and they don’t crave anyone else’s approval.Scorpio is like the big, bad older sister of the Water sign crew. You don’t mess with the turbulent, deadly scorpion my friend, their sting can be fatal - and they make the other signs of the zodiac (apart from maybe Aries, who they share a planetary influence with) look like wusses!"
    }
}
