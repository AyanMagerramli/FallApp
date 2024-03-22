//
//  LoginViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    var viewModel: LoginViewModel?
    private var user = LoginUserModel()
    private var registerUserModel = RegisterUserModel()
    
    //MARK: -UI Elements
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loginImage")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        let attributedPlaceholder = NSAttributedString(string: "  Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor.theme(named: .main)
        field.textAlignment = .left
        field.autocapitalizationType = .none
        field.font = UIFont.robotoFont(ofType: .light, size: 16)
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 24
        field.layer.borderColor = UIColor.theme(named: .main).cgColor
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        let attributedPlaceholder = NSAttributedString(string: "  Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor.theme(named: .main)
        field.textAlignment = .left
        field.autocapitalizationType = .none
        field.font = UIFont.robotoFont(ofType: .light, size: 16)
        field.borderStyle = .roundedRect
        field.isSecureTextEntry = true
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 24
        field.layer.borderColor = UIColor.theme(named: .main).cgColor
        
        return field
    }()
    
    private lazy var loginButton = ReusableButton(title: "Login")
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.textColor = .red
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Not any account?"
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.textColor = UIColor.theme(named: .main)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Create your user and begin your astrology journey right here"
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.textColor = UIColor.theme(named: .main)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    //MARK: -Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate of the email text field
        emailField.delegate = self
        
        setupUI()
        buttonActions()
        self.viewModel?.clearTokensFromKeychain()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func saveUserData() {
        UserdefaultsManager.shared.setValue(value: emailField.text, for: "email")
        KeychainManager.shared.setValue(value: passwordField.text ?? "", for: KeychainValues.password.rawValue)
    }
    
    //MARK: - Setup constraints
    
    private func makeConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottomMargin).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottomMargin).offset(48)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottomMargin).offset(24)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottomMargin).offset(70)
            make.centerX.equalToSuperview()
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        self.errorLabel.isHidden = true
        
        emailField.becomeFirstResponder()
        
        self.view.backgroundColor = UIColor.theme(named: .background)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(gesture)
        
        [image,
         emailField,
         passwordField,
         loginButton,
         errorLabel,
         loginLabel,
         registerLabel].forEach(view.addSubview(_:))
    
        makeConstraints()
    }
    
    @objc func dismissKeyboard () {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            // If return key is pressed while editing the email field,
            // make the password field become the first responder
            passwordField.becomeFirstResponder()
        }
        return true
    }
    
    // MARK: - Button actions
    
    private func buttonActions() {
        loginButton.buttonTappedHandler = { [weak self] in
            self?.setupUserData()
            self?.viewModel?.registerUser(userData: self?.registerUserModel ?? RegisterUserModel())
            
            self?.viewModel?.success = { [weak self] in
                DispatchQueue.main.async {
                    self?.saveUserData()
                }
            }
            self?.viewModel?.error = { [weak self] error in
                DispatchQueue.main.async {
                    self?.errorLabel.isHidden = false
                    self?.errorLabel.text = error.detail
                }
            }
            
            self?.viewModelSetup()
        }
    }
    
    private func setupUserData() {
        user.email = emailField.text ?? ""
        user.password = passwordField.text ?? ""
        
        registerUserModel.email = self.user.email
        registerUserModel.password = self.user.password
    }
    
    private func viewModelSetup() {
        viewModel?.registerSuccess = { [weak self] in
            DispatchQueue.main.async {
                print(self?.viewModel?.response?.message ?? "no message")
                UserdefaultsManager.shared.setValue(value: self?.viewModel?.registerResponse?.data?.message ?? "", for: "otp")
                self?.saveUserData()
                self?.viewModel?.coordinator.goToOtpScreen()
            }
        }
    }
}
