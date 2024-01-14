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
        let attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "mainColor") ?? .white])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor(named: "mainColor")
        field.textAlignment = .left
        field.font = UIFont.systemFont(ofSize: 16)
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 12
        field.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        let attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "mainColor") ?? .white])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor(named: "mainColor")
        field.textAlignment = .left
        field.font = UIFont.systemFont(ofSize: 16)
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 12
        field.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "mainColor")
        button.tintColor = .black
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didLoginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func didLoginButtonTapped() {
      print("Login button has been tapped")
    }
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Not any account?"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "mainColor")
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 12
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(didRegisterButtonTapped), for: .touchUpInside)
        return button
    }()
    
   @objc private func didRegisterButtonTapped() {
        let controller = RegisterViewController()
       navigationController?.show(controller, sender: nil)
    }
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Create your user and begin your astrology journey:"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "mainColor")
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    //MARK: -Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func didUserLogin() {
        UserDefaults.standard.setValue(true, forKey: "Logged in")   
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
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
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
            make.centerX.equalToSuperview()
        }
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        
        view.addSubview(image)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(loginLabel)
        view.addSubview(registerButton)
        view.addSubview(registerLabel)
        
        makeConstraints()
    }
}



   
