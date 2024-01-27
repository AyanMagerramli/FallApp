//
//  RegisterViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: Properties
    
    weak var coordinator: MainCoordinator?
    private let viewModel = RegisterViewModel()
    var myUser: RegisterUserModel = RegisterUserModel()
    
    //MARK: -UI Elements
    
  private let image: UIImageView = {
        let image = UIImageView()
      image.image = UIImage(named: "registerImage")
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
        field.font = UIFont.robotoFont(ofType: .light, size: 16)
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 24
        field.layer.borderColor = UIColor.theme(named: .main).cgColor
        
        return field
    }()
    
    private lazy var registerButton = ReusableButton(title: "Register")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
      //  viewModelSetup()
    }
    
    private func buttonActions() {
        registerButton.buttonTappedHandler = { [weak self] in
            self?.setupUserData()
            guard let user = self?.myUser else { return }
            self?.viewModel.registerUser(userData: user)
            self?.viewModelSetup()
        }
    }
    
    //MARK: -Setup Constraints
    
    private func makeConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(462)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottomMargin).offset(44)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottomMargin).offset(48)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    //MARK: -Setup UI
    
    private func setupUI() {
        self.view.backgroundColor = UIColor.theme(named: .background)
        
        view.addSubview(image)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        
        buttonActions()
        
        makeConstraints()
    }
    
    private func setupUserData() {
        self.myUser.email = emailField.text ?? ""
        self.myUser.password = passwordField.text ?? ""
    }
    
    private func viewModelSetup() {
        self.viewModel.success = { [weak self] in
            print(self?.viewModel.response?.message ?? "no message")
            self?.coordinator?.navigate(to: .otp)
        }
        
        self.viewModel.error = { [weak self] error in
            //error alert
            print(error)
        }
    }
}
