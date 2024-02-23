//
//  SuccessController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import UIKit
import SnapKit

class SuccessController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: SuccessViewModel
    
    // MARK: - Init
    
    init(viewModel: SuccessViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private let verifyIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.image = UIImage(named: "verifyIcon")
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoFont(ofType: .bold, size: 30)
        label.numberOfLines = 1
        label.text = "Updated"
        label.textColor = .main
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoFont(ofType: .medium, size: 16)
        label.numberOfLines = 0
        label.text = "Your password has been updated successfully!"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let doneButton = ReusableButton(title: "Done")
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        buttonAction()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .background
        
        [titleLabel,
         subtitleLabel,
         verifyIcon,
         doneButton].forEach(view.addSubview)
        
        makeConstraints()
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        
        verifyIcon.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(60)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.width.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(verifyIcon.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        doneButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
    
    // button action
    
    private func buttonAction() {
        doneButton.buttonTappedHandler = {
            self.viewModel.coordinator.goToSettingsScreen()
        }
    }
}
