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
    
    var viewModel: GenderViewModel
    var selectedGender: String?
    
    // MARK: - init
    
    init(viewModel: GenderViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    
    private lazy var completeButton = ReusableButton(title: "Complete")
    
    private func completeButtonAction() {
        completeButton.buttonTappedHandler = { [weak self] in
            // First set the selected gender
            self?.buttonActions()
            
            // Then setup builder data
            self?.setupBuilderData()
            print("Gender in complete button is \(String(describing: self?.selectedGender))")
            
            // After that, upload user data
            self?.viewModel.uploadUserData(userData: self?.viewModel.userDataModel ?? UploadUserDataModel())
            
            // Finally, call viewModelSetup()
            self?.viewModelSetup()
            
            ProgressManager.shared.progress += 0.25
        }
    }
    
    private lazy var maleButton = ReusableButton(title: "Male")
    private lazy var femaleButton = ReusableButton(title: "Femael")
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What is your Gender?"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
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
        updateProgress()
        buttonActions()
        completeButtonAction()
        
        print("ACCESS TOKEN IS \(KeychainManager.shared.getValue(key: KeychainValues.accessToken.rawValue) ?? "")")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme(named: .background)
        
        customizeBackButton()
        
        [titleLabel,
        completeButton,
         stackView].forEach(view.addSubview(_:))
        
        makeConstraints()
        setupButtonsUI()
    }
    
    private func setupButtonsUI() {
        femaleButton.setImage(UIImage(named: "femaleLogo"), for: .normal)
        femaleButton.backgroundColor = .clear
        femaleButton.layer.borderColor = UIColor.theme(named: .main).cgColor
        femaleButton.layer.borderWidth = 1.0
        femaleButton.imageView?.contentMode = .scaleAspectFit
        femaleButton.setTitleColor(UIColor.theme(named: .main), for: .normal)
        
        maleButton.setImage(UIImage(named: "maleLogo"), for: .normal)
        maleButton.backgroundColor = .clear
        maleButton.layer.borderColor = UIColor.theme(named: .main).cgColor
        maleButton.layer.borderWidth = 1.0
        maleButton.imageView?.contentMode = .scaleAspectFit
        maleButton.setTitleColor(UIColor.theme(named: .main), for: .normal)
    }
    
    private func buttonActions() {
        maleButton.buttonTappedHandler = { [weak self] in
            self?.selectedGender = "Male"
            self?.maleButton.isSelected = true
            self?.femaleButton.isSelected = false
        }
        
        femaleButton.buttonTappedHandler = { [weak self] in
            self?.selectedGender = "Female"
            self?.maleButton.isSelected = false
            self?.femaleButton.isSelected = true
        }
        
        print("Gender is \(String(describing: self.selectedGender))")
        UserInfoBuilder.shared.gender = self.selectedGender
    }
    
    private func setupBuilderData() {
        self.viewModel.userDataModel.name = UserInfoBuilder.shared.name ?? ""
        self.viewModel.userDataModel.city = UserInfoBuilder.shared.birthCity ?? ""
        self.viewModel.userDataModel.gender = UserInfoBuilder.shared.gender ?? ""
        if let birthDate = UserInfoBuilder.shared.birthDate,
           let birthTime = UserInfoBuilder.shared.birthTime {
            self.viewModel.userDataModel.birthDate = "\(birthDate) \(birthTime)"
        }
    }
    
    // MARK: - Update Progress Bar
    
    func updateProgress() {
          let progress = ProgressManager.shared.progress
          self.navigationController?.addProgressBar(progress: progress)
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
    
    private func viewModelSetup() {
        viewModel.success = { [weak self] in
            UserdefaultsManager.shared.setValue(value: self?.viewModel.successModel?.data?.zodiacSign, for: "zodiacSign")
            self?.viewModel.coordinator?.navigate(to: .zodiacInfo)
          //  UserDefaults.standard.setValue(self?.viewModel.successModel?.data?.zodiacSign, forKey: "zodiacSign")
        }
    }
}
