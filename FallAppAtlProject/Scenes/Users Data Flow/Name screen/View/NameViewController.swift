//
//  NameViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 20.01.24.
//

import UIKit
import SnapKit

class NameViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: NameViewModel
    
    // MARK: -Init
    
    init(viewModel: NameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components
    
    private lazy var continueButton = ReusableButton(title: "Continue")
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How can we call You?"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: "mainColor")
        return label
    }()
    
    private lazy var nameField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        field.borderStyle = .roundedRect
        let attributedPlaceholder = NSAttributedString(string: " Your magic name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.theme(named: .main)])
        field.attributedPlaceholder = attributedPlaceholder
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
        buttonAction()
        updateProgress()
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme(named: .background)
        
        customizeBackButton()
        
        [titleLabel,
         strokeView,
         nameField,
         continueButton].forEach(view.addSubview(_:))
        
        makeConstraints()
    }
    
    private func buttonAction() {
        continueButton.buttonTappedHandler = { [weak self] in
            ProgressManager.shared.progress += 0.25
            if let name = self?.nameField.text {
                UserInfoBuilder.shared.name = name
            }
            self?.viewModel.coordinator.navigate(to: .gender)
        }
    }
    
    // MARK: - Update Progress Bar
    
    func updateProgress() {
          let progress = ProgressManager.shared.progress
          self.navigationController?.addProgressBar(progress: progress)
      }
    
    //MARK: - Setup Constraints
    
    private func makeConstraints() {
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        nameField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(50)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        strokeView.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottomMargin).offset(4)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
}
