//
//  BirthdayViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 19.01.24.
//

import UIKit
import SnapKit

class BirthdayViewController: UIViewController {
    
    //MARK: Properties
    
    //MARK: - UI Elements
    
    private lazy var continueButton = ReusableButton(title: "Continue")

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(continueButton)
        didContinueButtonTapped()
        makeConstraints()
    }
    
    private func didContinueButtonTapped() {
        continueButton.buttonTappedHandler = {
            let vc = BirthCityViewController()
            self.navigationController?.show(vc, sender: nil)
        }
    }
    
    //MARK: Setup constraints
    
    private func makeConstraints() {
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.centerX.equalToSuperview()
        }
    }
    
}
