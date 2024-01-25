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
    
    // MARK: UI Elements
    
    private lazy var approveButton = ReusableButton(title: "Approve")
    
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
        return field
    }()
    
    private lazy var strokeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.theme(named: .main)
        return view
    }()
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        customizeBackButton()
        
        view.backgroundColor = UIColor.theme(named: .background)
        
        view.addSubview(titleLabel)
        view.addSubview(otpField)
        view.addSubview(strokeView)
        view.addSubview(approveButton)
        
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
        
        approveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
}
