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
        
        view.addSubview(image)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(loginLabel)
        view.addSubview(registerButton)
        view.addSubview(registerLabel)
        
        makeConstraints()
    }
    
    private func buttonActions() {
        loginButton.buttonTappedHandler = {
            self.didUserLogin()
            let vc = ParentViewController()
              self.navigationController?.show(vc, sender: nil)
        }
        
        registerButton.buttonTappedHandler = {
            let vc = RegisterViewController()
            self.navigationController?.show(vc, sender: nil)
        }
    }
}



   
