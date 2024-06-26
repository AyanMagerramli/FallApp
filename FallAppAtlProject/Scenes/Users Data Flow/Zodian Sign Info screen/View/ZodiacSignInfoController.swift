//
//  ZodiacSignInfoController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 03.02.24.
//

import UIKit
import SnapKit

class ZodiacSignInfoController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: ZodiacSignInfiViewModel
    
    // MARK: - UI elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HomeDetailBackground")
        image.contentMode = .scaleAspectFill
        image.frame = view.bounds
        return image
    }()
    
    private lazy var zodiacLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 30)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var completeButton = ReusableButton(title: "Begin Journey")
    
    // MARK: - Init

    init(viewModel: ZodiacSignInfiViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        buttonAction()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        
        zodiacLabel.text = "You are \(String(describing: viewModel.zodiacSign))"
        
        [backgroundImage,
         zodiacLabel,
         completeButton].forEach(view.addSubview(_:))
        
        // Send the image view to the back so other UI elements are on top
        view.sendSubviewToBack(backgroundImage)
        view.backgroundColor = .clear
        
        makeConstraints()
    }
    
    private func buttonAction() {
        completeButton.buttonTappedHandler = { [weak self] in
            self?.didUserLogin()
           // self?.viewModel.coordinator.start()
        }
    }
    
    private func didUserLogin() {
        UserDefaults.standard.setValue(true, forKey: "loggedIn")
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        zodiacLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
}
