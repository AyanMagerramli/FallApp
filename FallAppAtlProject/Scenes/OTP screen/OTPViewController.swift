//
//  OTPViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import UIKit
import SnapKit

class OTPViewController: UIViewController {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    
    // MARK: UI Elements
    
    private lazy var approveButton = ReusableButton(title: "Confirm")
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add your magic OTP here:"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var otpField: UITextField = {
        let field = UITextField()
        field.font = UIFont.robotoFont(ofType: .medium, size: 22)
        field.textAlignment = .center
        field.borderStyle = .roundedRect
        field.backgroundColor = .clear
        field.textColor = UIColor.theme(named: .main)
        return field
    }()
    
    private lazy var strokeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.theme(named: .main)
        return view
    }()
    
    private lazy var resendButton = ReusableButton(title: "Resend")
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        customizeBackButton()
        
        view.backgroundColor = UIColor.theme(named: .background)
        
        [titleLabel,
         otpField,
         strokeView,
         resendButton,
         approveButton].forEach(view.addSubview(_:))
        
        makeConstraints()
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        otpField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(50)
        }
        
        strokeView.snp.makeConstraints { make in
            make.top.equalTo(otpField.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalTo(otpField)
        }
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(strokeView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        approveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
}
