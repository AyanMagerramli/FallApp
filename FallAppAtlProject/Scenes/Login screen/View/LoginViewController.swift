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
    
    private var viewModel: LoginViewModel
    private var user = LoginUserModel()
    private  var registerUserModel = RegisterUserModel()
    
    //MARK: - Init
    
    init (viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        viewModelSetup()
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
        loginButton.buttonTappedHandler = { [weak self] in
            self?.didUserLogin()
            self?.setupUserData()
   
            self?.viewModel.registerUser(userData: self?.registerUserModel ?? RegisterUserModel())
        }
        
        registerButton.buttonTappedHandler = {
            self.viewModel.coordinator.navigate(to: .register)
        }
    }
    
    private func setupUserData() {
        user.email = emailField.text ?? ""
        user.password = passwordField.text ?? ""
        
        registerUserModel.email = self.user.email
        registerUserModel.password = self.user.password
    }
    
    private func viewModelSetup() {
        viewModel.success = { [weak self] in
            print(self?.viewModel.response?.message ?? "no message")
            self?.viewModel.coordinator.navigate(to: .birtDate) //This should change according to hasData field
        }
    }
}
