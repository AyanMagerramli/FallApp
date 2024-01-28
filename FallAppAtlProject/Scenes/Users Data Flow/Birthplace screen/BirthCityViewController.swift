//
//  BirthCityViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 19.01.24.
//

import UIKit
import SnapKit

class BirthCityViewController: UIViewController {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    var builder: UserInfoBuilder?
    
    let cities = ["City1", "City2", "City3"]
    let countries = ["Country1", "Country2", "Country3"]
    
    // MARK: - UI Elements
    
    private lazy var continueButton = ReusableButton(title: "Continue")
    
    private func buttonAction() {
        continueButton.buttonTappedHandler = {
            ProgressManager.shared.progress += 0.25
            if let birthCountry = self.countryPickerTextField.text,
               let birthCity = self.cityPickerTextField.text {
                self.builder?.birthCity = birthCity
                self.builder?.birthCountry = birthCountry
            }
            let vc = NameViewController()
            vc.builder = self.builder
           // self.mainViewController?.add(childViewController: vc)
            self.coordinator?.navigate(to: .name)
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
        let attributedPlaceholder = NSAttributedString(string: "  City", attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor.theme(named: .main)
        return field
    }()
    
    lazy var countryPickerTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        field.borderStyle = .roundedRect
        let attributedPlaceholder = NSAttributedString(string: "  Country", attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
        field.textColor = UIColor.theme(named: .main)
        return field
    }()
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateProgress()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme(named: .background)
        
        customizeBackButton()
        
        [titleLabel,
         cityPickerTextField,
         countryPickerTextField,
         strokeView1,
         strokeView2,
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
    }
}


