//
//  BirthCityViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 19.01.24.
//

import UIKit
import SnapKit

class BirthPlaceViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel:  BirthPlaceViewModel
    var countryList: CountryModel?
    var isMovingBack: Bool?
    
    // MARK: - Init
    
    init(viewModel: BirthPlaceViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.textColor = .red
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.text = "Please fill both country and city fields"
        return label
    }()
    
    private lazy var continueButton = ReusableButton(title: "Continue")
    
    private func buttonAction() {
        continueButton.buttonTappedHandler = {
            ProgressManager.shared.progress += 0.25
            if let birthCountry = self.countryPickerTextField.text,
               let birthCity = self.cityPickerTextField.text {
                UserInfoBuilder.shared.birthCity = birthCity
                UserInfoBuilder.shared.birthCountry = birthCountry
            }
            print("Date is \(String(describing: UserInfoBuilder.shared.birthDate)), City is \(String(describing: UserInfoBuilder.shared.birthCity))")
            if !(self.countryPickerTextField.text?.isEmpty ?? true || self.cityPickerTextField.text?.isEmpty ?? true) {
                self.viewModel.coordinator.navigate(to: .name)
            } else {
                self.errorLabel.isHidden = false
            }
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What is your Birthplace?"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var strokeView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.theme(named: .main)
        return view
    }()
    
    private lazy var strokeView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.theme(named: .main)
        return view
    }()
    
    let cityPicker = UIPickerView()
    let countryPicker = UIPickerView()
    
    lazy var cityPickerTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        field.borderStyle = .roundedRect
        let attributedPlaceholder = NSAttributedString(string: "City", attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor.theme(named: .main)
        return field
    }()
    
    lazy var countryPickerTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        field.borderStyle = .roundedRect
        let attributedPlaceholder = NSAttributedString(string: "Country", attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor.theme(named: .main)
        return field
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateProgress()
        viewModelSetup()
        self.viewModel.downloadCountries()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme(named: .background)
        
        customizeBackButton()
        
        errorLabel.isHidden = true
        
        [titleLabel,
         cityPickerTextField,
         countryPickerTextField,
         strokeView1,
         strokeView2,
         errorLabel,
         continueButton
        ].forEach(view.addSubview(_:))
                
        makeConstraints()
        
        setupCityPicker()
        setupCountryPicker()
        buttonAction()
    }
    
    // MARK: - Update Progress Bar
    
    func updateProgress() {
          let progress = ProgressManager.shared.progress
          self.navigationController?.addProgressBar(progress: progress)
      }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        countryPickerTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(50)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        strokeView1.snp.makeConstraints { make in
            make.top.equalTo(countryPickerTextField.snp.bottomMargin).offset(4)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        cityPickerTextField.snp.makeConstraints { make in
            make.top.equalTo(strokeView1.snp.bottomMargin).offset(60)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        strokeView2.snp.makeConstraints { make in
            make.top.equalTo(cityPickerTextField.snp.bottomMargin).offset(4)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(strokeView2.snp.bottom).offset(60)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    private func viewModelSetup() {
        self.viewModel.success = {
          //  self.countryList = self.viewModel.successModel
            
        }
    }
}


