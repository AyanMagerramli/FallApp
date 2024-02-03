//
//  OTPViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import UIKit
import SnapKit
import KeychainSwift

class OTPViewController: UIViewController {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    private let viewModel = OTPViewModel()
    var otpModel = OTPResponseModel()
    var otpResetModel = OTPResetModel()
    let keychain = KeychainSwift()
    
    // MARK: - UI Elements
    
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
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 12)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .main
        return label
    }()
    
    private lazy var resendButton = ReusableButton(title: "Resend")
    
    private func buttonActions () {
        approveButton.buttonTappedHandler = { [weak self] in
            self?.setupUserData()
            guard let otp = self?.otpModel else {return}
            self?.viewModel.confirmOTP(otpData: otp)
            print(otp)
            self?.viewModelSetup()
        }
        
        resendButton.buttonTappedHandler = { [weak self] in
            self?.setupResetOTPData()
            guard let otp = self?.otpResetModel else {return}
            print("OTPMODEL is \(otp)")
            self?.viewModel.resetOTP(otpData: otp)
        }
    }
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        customizeBackButton()
        
        messageLabel.text = UserDefaults.standard.string(forKey: "otp")
        
        view.backgroundColor = UIColor.theme(named: .background)
        
        resendButton.backgroundColor = .clear
        resendButton.setTitleColor(.main, for: .normal)
        
        [titleLabel,
         otpField,
         strokeView,
         messageLabel,
         resendButton,
         approveButton].forEach(view.addSubview(_:))
        
        makeConstraints()
        
        buttonActions()
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
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(strokeView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        approveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    private func setupUserData() {
        let email = UserDefaults.standard.string(forKey: "email")
        self.otpModel.email = email ?? "no email"
        self.otpModel.pin = otpField.text ?? "no otp"
    }
    
    private func setupResetOTPData() {
        let email = UserDefaults.standard.string(forKey: "email")
        self.otpResetModel.email = email
        self.otpResetModel.password = keychain.get("password")
    }
    
    private func viewModelSetup() {
        self.viewModel.success = { [weak self] in
            print(self?.viewModel.successResponse?.message ?? "no message")
            self?.navigationController?.popViewController(animated: true)
         //   self?.coordinator?.navigate(to: .login)
        }
        
        self.viewModel.error = { [weak self] error in
            //error alert
            print(error)
        }
    }
}
