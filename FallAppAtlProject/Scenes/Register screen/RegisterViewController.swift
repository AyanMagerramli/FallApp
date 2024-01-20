//
//  RegisterViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: Properties
    
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
        let attributedPlaceholder = NSAttributedString(string: "  Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "mainColor") ?? .white])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor(named: "mainColor")
        field.textAlignment = .left
        field.font = UIFont.systemFont(ofSize: 16)
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 24
        field.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        let attributedPlaceholder = NSAttributedString(string: "  Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "mainColor") ?? .white])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor(named: "mainColor")
        field.textAlignment = .left
        field.font = UIFont.systemFont(ofSize: 16)
        field.borderStyle = .roundedRect
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 24
        field.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        
        return field
    }()
    
    private lazy var registerButton = ReusableButton(title: "Register")
    
    private lazy var facebookButton = ReusableButton(title: "Facebook")

    private lazy var googleButton = ReusableButton(title: "Google")
    
    private lazy var stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [googleButton, facebookButton])
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 16
            return stackView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func buttonActions() {
        registerButton.buttonTappedHandler = {
            print("Register button has been tapped")
        }
        
        facebookButton.buttonTappedHandler = {
            print("Google button has been tapped")
        }
        
        facebookButton.setImage(UIImage(named: "facebookLogo"), for: .normal)
        facebookButton.backgroundColor = .clear
        facebookButton.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        facebookButton.layer.borderWidth = 1.0
        facebookButton.imageView?.contentMode = .scaleAspectFit
        facebookButton.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        
        googleButton.setImage(UIImage(named: "googleLogo"), for: .normal)
        googleButton.backgroundColor = .clear
        googleButton.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        googleButton.layer.borderWidth = 1.0
        googleButton.imageView?.contentMode = .scaleAspectFit
        googleButton.setTitleColor(UIColor(named: "mainColor"), for: .normal)
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
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottomMargin).offset(32)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    //MARK: -Setup UI
    
    private func setupUI() {
        self.view.backgroundColor = UIColor(named: "backgroundColor")
        
        view.addSubview(image)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        view.addSubview(stackView)
        
        buttonActions()
        
        makeConstraints()
    }
}
