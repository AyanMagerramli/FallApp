//
//  ResetPasswordController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import UIKit

class ResetPasswordController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: ResetPasswordViewModel
    
    // MARK: UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Now time to change your password"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .main
        label.font = .robotoFont(ofType: .medium, size: 16)
        return label
    }()
    
    private let otpField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        let attributedPlaceholder = NSAttributedString(string: " New password",
                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = .main
        field.textAlignment = .left
        field.autocapitalizationType = .none
        field.font = UIFont.robotoFont(ofType: .light, size: 16)
        field.borderStyle = .roundedRect
        field.layer.borderColor = UIColor.theme(named: .main).cgColor
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 24
        
        return field
    }()
    
    private lazy var resetPasswordButton = ReusableButton(title: "Reset password")
    
    // MARK: - Init
    
    init(viewModel: ResetPasswordViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        resetPasswordButtonAction()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        navigationItem.title = "Verify OTP"
        
        view.backgroundColor = .background
        
        [titleLabel,
         otpField,
         resetPasswordButton].forEach(view.addSubview)
        
        makeConstraints()
    }
    
    // MARK: - Setup constraints
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        otpField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        
        resetPasswordButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    //button action
    
    private func resetPasswordButtonAction() {
        resetPasswordButton.buttonTappedHandler = { [weak self] in
            // navigate into success screen
        }
    }
}
