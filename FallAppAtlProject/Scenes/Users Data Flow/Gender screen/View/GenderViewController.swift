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
    
    var viewModel: GenderScreenViewModel
    var builder: UserInfoBuilder?
    var selectedGender: String?
    
    // MARK: - init
    
    init(viewModel: GenderScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    
    private lazy var completeButton = ReusableButton(title: "Complete")
    
    private func completeButtonAction() {
        completeButton.buttonTappedHandler = {
            ProgressManager.shared.progress += 0.25
            //send all user datas from builder to api
            self.setupBuilderData()
            self.viewModel.uploadUserData(userData: self.viewModel.userDataModel ?? UploadUserDataModel())
            
            self.viewModelSetup()
            self.viewModel.coordinator?.navigate(to: .zodiacInfo)
        }
    }
    
    private lazy var maleButton = ReusableButton(title: "Male")
    private lazy var femaleButton = ReusableButton(title: "Femael")
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ayan, what is your Gender?"
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
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme(named: .background)
        
        customizeBackButton()
        
        [titleLabel,
        completeButton,
         stackView].forEach(view.addSubview(_:))
        
        makeConstraints()
        completeButtonAction()
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
        maleButton.buttonTappedHandler = {
            self.selectedGender = "Male"
            self.maleButton.isSelected = true
            self.femaleButton.isSelected = false
        }
        
        femaleButton.buttonTappedHandler = {
            self.selectedGender = "Female"
            self.maleButton.isSelected = false
            self.femaleButton.isSelected = true
        }
        
        self.builder?.gender = self.selectedGender
    }
    
    private func setupBuilderData() {
        self.viewModel.userDataModel?.name = self.builder?.name
        self.viewModel.userDataModel?.birthdate = self.builder?.birthDate
        self.viewModel.userDataModel?.city = self.builder?.birthCity
        self.viewModel.userDataModel?.name = self.builder?.gender
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
           // print(self?.viewModel.response?.message ?? "no message")
            self?.viewModel.coordinator?.start() //This should change according to hasData field
        }
    }
}