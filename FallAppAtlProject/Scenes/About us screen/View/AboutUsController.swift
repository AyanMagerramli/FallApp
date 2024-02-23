//
//  AboutUsController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 24.02.24.
//

import UIKit
import SnapKit

class AboutUsController: UIViewController {
    
    // MARK: - UI Elements

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.main, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "About us"
        label.textColor = .main
        label.font = .robotoFont(ofType: .bold, size: 50)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .main
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to your daily guide to the mystical world of astrology and tarot cards. At Astroland, we're dedicated to bringing you insightful predictions and personalized readings to illuminate your path in life. Explore your daily, monthly, and yearly horoscopes tailored to your zodiac sign, and discover the cosmic forces at play in your life. Dive into the ancient wisdom of tarot cards and unlock the secrets of your subconscious mind. With Astroland, embark on a journey of self-discovery, empowerment, and enlightenment. Trust in the stars, and let us be your compass in navigating life's twists and turns."
        label.textColor = .black
        label.font = .robotoFont(ofType: .bold, size: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .justified
        return label
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .background
        
        containerView.addSubview(textLabel)
        
        [titleLabel,
         containerView,
         closeButton].forEach(view.addSubview)
        
        makeConstraints()
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(24)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(60)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(36)
            make.leading.equalToSuperview().inset(60)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(450)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(12)
            make.trailing.equalToSuperview().inset(12)
        }
        
        textLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(14)
            make.top.equalToSuperview().inset(14)
        }
    }
    
    // button action
    
    @objc
    private func didTapCloseButton() {
        self.dismiss(animated: true)
    }
}
