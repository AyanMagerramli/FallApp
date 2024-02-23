//
//  TermsAndConditionsController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 24.02.24.
//

import UIKit

class TermsAndConditionsController: UIViewController {
    
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
        label.text = "Terms and Conditions"
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
        label.text = "By using Astroland, you agree to our Terms and Conditions. We offer astrology, horoscope, and tarot card predictions for entertainment and informational purposes only. While we strive for accuracy, we cannot guarantee completeness or reliability. Our predictions are not a substitute for professional advice. We may collect personal data to personalize predictions and improve user experience, respecting your privacy. We use AI algorithms to enhance prediction accuracy, but they may not always reflect individual circumstances accurately. If you disagree with our terms, please refrain from using our services."
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
            make.top.equalTo(titleLabel.snp.bottom).offset(44)
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
