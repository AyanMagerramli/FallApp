//
//  ConfirmOTPController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 22.02.24.
//

import UIKit
import SnapKit

class ConfirmOTPController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: ConfirmOTPViewModel
    
    // MARK: - Init
    
    init(viewModel: ConfirmOTPViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "We sent OTP to your mail. Add it below."
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
        let attributedPlaceholder = NSAttributedString(string: " OTP",
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
    
    private lazy var continueButton = ReusableButton(title: "Continue")
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        continueButtonAction()
        setupViewModel()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        navigationItem.title = "Verify OTP"
        
        view.backgroundColor = .background
        
        otpField.becomeFirstResponder()
        
        [titleLabel,
         otpField,
         continueButton].forEach(view.addSubview)
        
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
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    // MARK: - Setup View Model
    
    private func setupViewModel() {
        viewModel.sendOTP()
        
        viewModel.success = { [weak self] in
            self?.titleLabel.text = self?.viewModel.sendOTPData?.data
        }
    }
    
    //button action
    
    private func continueButtonAction () {
        
        continueButton.buttonTappedHandler = { [weak self] in
                guard let self = self else { return }

            let email = UserdefaultsManager.shared.getValue(for: "email") ?? ""
            let enteredOTP = self.otpField.text ?? ""
        
            let otpVerifyBody = VerifyOTPResponseModel(
                mail: email,
                otp: enteredOTP)
            
            // Make the API call to verify OTP
            self.viewModel.verifyOTP(body: otpVerifyBody)
            
            // Handle success in viewModel
            self.viewModel.success = { [weak self] in
                
                print("BODY ISSS \(otpVerifyBody)")
                // Navigate to reset password screen upon successful OTP verification
                self?.viewModel.coordinator.goToResetPasswordScreen(code: self?.viewModel.verifyOTPData?.data ?? "")
            }
        }
    }
}
