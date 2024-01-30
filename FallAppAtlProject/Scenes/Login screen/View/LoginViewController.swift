//
//  LoginViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK: Properties

    private let viewModel = LoginViewModel()
    var coordinator: MainCoordinator?
    var user = LoginUserModel()
    var registerUserModel = RegisterUserModel()
    
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
    
    private lazy var loginButton = ReusableButton(title: "Login")
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Not any account?"
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.textColor = UIColor.theme(named: .main)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
   private lazy var registerButton = ReusableButton(title: "Register")
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Create your user and begin your astrology journey:"
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
        setupUI()
        buttonActions()
    }
    
    private func didUserLogin() {
      //  UserDefaults.standard.setValue(true, forKey: "Logged in")
    }
    
    //MARK: - Setup constraints
    
    private func makeConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(462)
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
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottomMargin).offset(90)
            make.centerX.equalToSuperview()
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        self.view.backgroundColor = UIColor.theme(named: .background)
        
        [image,
         emailField,
         passwordField,
         loginButton,
         loginLabel,
         registerLabel,
         registerButton].forEach(view.addSubview(_:))
        
        registerButton.backgroundColor = .background
        registerButton.setTitleColor(.main, for: .normal)
        registerButton.titleLabel?.font = .robotoFont(ofType: .bold, size: 18)
        
        makeConstraints()
    }
    
    private func buttonActions() {
        loginButton.buttonTappedHandler = {
            self.didUserLogin()
            self.setupUserData()
            
            self.viewModel.registerUser(userData: self.registerUserModel)
            self.viewModel.error = { [weak self] error in
                if let statusCode = self?.viewModel.errorResponse?.status {
                    if statusCode == 409 {
                        // User is already registered, proceed with login
                        self?.viewModel.loginUser(userData: self?.user ?? LoginUserModel())
                        self?.viewModelSetup()
                    } else {
                        // Handle other errors, if needed
                        print("Error with status code: \(statusCode)")
                    }
                } else {
                    // Handle other errors, if needed
                    print("Unknown error occurred")
                }
            }
        }
        
        registerButton.buttonTappedHandler = {
            self.coordinator?.navigate(to: .register)
        }
    }
    
    private func setupUserData() {
        self.user.email = emailField.text ?? ""
        self.user.password = passwordField.text ?? ""
        
        self.registerUserModel.email = self.user.email
        self.registerUserModel.password = self.user.password
    }
    
    private func viewModelSetup() {
        self.viewModel.success = { [weak self] in
            print(self?.viewModel.response?.message ?? "no message")
            self?.coordinator?.navigate(to: .birtDate) //This should change according to hasData field
        }
        
//        self.viewModel.error = { [weak self] error in
//            //error alert
//            print(error)
//        }
    }
}



   
