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
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "mainColor")
        button.tintColor = .black
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didRegisterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func didRegisterButtonTapped() {
      print("Register button has been tapped")
    }

    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Are you excited? Create your user and begin your astrology journey"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "mainColor")
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("Google", for: .normal)
        button.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8) // Adjust the spacing between image and title
        button.setImage(UIImage(named: "googleLogo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didGoogleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func didGoogleButtonTapped() {
      print("Google button has been tapped")
    }
    
    private let facebookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8) // Adjust the spacing between image and title
        button.setImage(UIImage(named: "facebookLogo"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didFacebookButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func didFacebookButtonTapped() {
      print("Google button has been tapped")
    }

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
    
    //MARK: -Setup Constraints
    
    private func makeConstraints() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(462)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottomMargin).offset(32)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottomMargin).offset(48)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottomMargin).offset(20)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottomMargin).offset(40)
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
        view.addSubview(registerLabel)
        view.addSubview(stackView)
        
        makeConstraints()
    }
}
