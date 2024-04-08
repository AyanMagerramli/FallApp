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
    private let viewModel = OTPViewModel()
    var otpModel = OTPResponseModel()
    var otpResetModel = OTPResetModel()
    
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
        field.keyboardType = .numberPad
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
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 12)
        label.lineBreakMode = .byWordWrapping
        label.textColor = .red
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var resendButton = ReusableButton(title: "Resend")
        
    private func buttonActions() {
        approveButton.buttonTappedHandler = { [weak self] in
            guard let self = self else { return }
            self.viewModel.success = { [weak self] in
                guard let self = self else { return }
                print(self.viewModel.successResponse?.message ?? "No message")
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
            self.viewModel.error = { [weak self] error in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.errorLabel.isHidden = false
                    self.errorLabel.text = self.viewModel.errorResponse?.detail
                    print("OTP ERROR: \(error)")
                }
            }
            
            self.setupUserData()
            let otp = self.otpModel
            self.viewModel.confirmOTP(otpData: otp)
        }
        
        
        resendButton.buttonTappedHandler = { [weak self] in
            self?.setupResetOTPData()
            guard let otp = self?.otpResetModel else { return }
            print("OTPMODEL is \(otp)")
            self?.viewModel.resetOTP(otpData: otp)
        }
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        buttonActions()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        customizeBackButton()
        
        otpField.delegate = self
        
        errorLabel.isHidden = true
        messageLabel.text = UserdefaultsManager.shared.getValue(for: "otp")
        
        otpField.becomeFirstResponder()
        
        view.backgroundColor = UIColor.theme(named: .background)
        
        resendButton.backgroundColor = .clear
        resendButton.setTitleColor(.main, for: .normal)
        
        [titleLabel,
         otpField,
         strokeView,
         messageLabel,
         errorLabel,
         resendButton,
         approveButton].forEach(view.addSubview)
        
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
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(strokeView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(errorLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        approveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    private func setupUserData() {
        let email = UserdefaultsManager.shared.getValue(for: "email") ?? ""
        self.otpModel.email = email
        self.otpModel.pin = otpField.text ?? "no otp"
    }
    
    private func setupResetOTPData() {
        let email = UserdefaultsManager.shared.getValue(for: "email") ?? ""
        self.otpResetModel.email = email
        self.otpResetModel.password = KeychainManager.shared.getValue(key: KeychainValues.password.rawValue)
    }
}

// MARK: - UITextFieldDelegate methods
// set the maximum length of decimal characters in text field
extension OTPViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        if !allowedCharacters.isSuperset(of: characterSet) {
            return false
        }
        
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let maxLength = 6
        return newText.count <= maxLength
    }
}
