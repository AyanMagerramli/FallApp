//
//  GenderViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 20.01.24.
//

import UIKit
import SnapKit

class GenderViewController: UIViewController {
    
    // MARK: Properties
    
    // MARK: - UI Components
    
    private lazy var completeButton = ReusableButton(title: "Complete")
    
    private func completeButtonAction() {
        completeButton.buttonTappedHandler = {
            
        }
    }
    
    private lazy var maleButton = ReusableButton(title: "Male")
    private lazy var femaleButton = ReusableButton(title: "Femael")
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ayan, what is your Gender?"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: "mainColor")
        return label
    }()
    
    private lazy var stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [maleButton, femaleButton])
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 16
            return stackView
        }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        view.addSubview(titleLabel)
        view.addSubview(completeButton)
        view.addSubview(stackView)
        
        makeConstraints()
        completeButtonAction()
        setupButtonsUI()
    }
    
    private func setupButtonsUI() {
        femaleButton.setImage(UIImage(named: "femaleLogo"), for: .normal)
        femaleButton.backgroundColor = .clear
        femaleButton.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        femaleButton.layer.borderWidth = 1.0
        femaleButton.imageView?.contentMode = .scaleAspectFit
        femaleButton.setTitleColor(UIColor(named: "mainColor"), for: .normal)
        
        maleButton.setImage(UIImage(named: "maleLogo"), for: .normal)
        maleButton.backgroundColor = .clear
        maleButton.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        maleButton.layer.borderWidth = 1.0
        maleButton.imageView?.contentMode = .scaleAspectFit
        maleButton.setTitleColor(UIColor(named: "mainColor"), for: .normal)
    }
    
    // MARK: - Make Constraints
    
    private func makeConstraints() {
        completeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
            make.height.equalTo(270)
        }
    }
}
