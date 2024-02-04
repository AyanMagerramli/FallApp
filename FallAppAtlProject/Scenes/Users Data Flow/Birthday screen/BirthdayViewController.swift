//
//  BirthdayViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 19.01.24.
//

import UIKit
import SnapKit

class BirthdayViewController: UIViewController {
    
    // MARK: Properties
    
     var viewModel: BirthdayViewModel
    // Store the previous dates for comparison
    private var previousTimeDate: Date?
    private var previousDatePicker: Date?
    
    // MARK: - Init
    
    init(viewModel: BirthdayViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What is your Date of Birth?"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .bold, size: 20)
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor.theme(named: .main)
        return label
    }()
    
    private lazy var dateField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.backgroundColor = .clear
        field.textColor = UIColor.theme(named: .main)
        field.inputView = datePicker
        field.text = formatDate(Date())
        return field
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.robotoFont(ofType: .light, size: 16)
        label.textColor = .red
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.text = "Please fill both Date and Time fields"
        return label
    }()
    
    private lazy var strokeView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.theme(named: .main)
        return view
    }()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    private lazy var continueButton = ReusableButton(title: "Continue")
    
    private lazy var birthTimeField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.backgroundColor = .clear
        field.textColor = UIColor.theme(named: .main)
        field.inputView = timePicker
        field.text = formatTime(Date())
        return field
    }()
    
    private lazy var strokeView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.theme(named: .main)
        return view
    }()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateProgress()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {        
        view.backgroundColor = UIColor.theme(named: .background)
        
        self.errorLabel.isHidden = true
        
        customizeBackButton()
        
        [titleLabel,
         continueButton,
         dateField,
         strokeView1,
         birthTimeField,
         errorLabel,
         strokeView2
        ].forEach(view.addSubview(_:))
        
        didContinueButtonTapped()
        makeConstraints()
        setupDatePicker()
        setupTimePicker()
    }
    
    private func didContinueButtonTapped() {
        continueButton.buttonTappedHandler = { [weak self] in
            ProgressManager.shared.progress += 0.25
            self?.viewModel.coordinator.navigate(to: .birthCity)
        }
    }
    
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .clear
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateValueChanged), for: .valueChanged)
        
        // Set up the toolbar with a "Done" button to dismiss the picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)

        dateField.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped() {
        // Handle the "Done" button tap, you may dismiss the keyboard or perform any other action
        view.endEditing(true)
        UserInfoBuilder.shared.birthDate = dateField.text
        print("Birth DATE is \(String(describing: UserInfoBuilder.shared.birthDate))")
        birthTimeField.becomeFirstResponder()
    }
    
    @objc private func dateValueChanged() {
        dateField.text = formatDate(datePicker.date)
    }
    
    private func formatDate(_ date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
    
    func formatTime(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter.string(from: date)
    }
    
    private func setupTimePicker() {
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.backgroundColor = .clear
        timePicker.frame.size = CGSize(width: 0, height: 300)
        timePicker.maximumDate = Date()
        timePicker.addTarget(self, action: #selector(timeValueChanged), for: .valueChanged)
        
        // Set up the toolbar with a "Done" button to dismiss the picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(done2ButtonTapped))
        toolbar.setItems([doneButton], animated: false)

        birthTimeField.inputAccessoryView = toolbar
    }
    
    @objc private func done2ButtonTapped() {
        // Handle the "Done" button tap, you may dismiss the keyboard or perform any other action
        view.endEditing(true)
        UserInfoBuilder.shared.birthTime = birthTimeField.text
        print("Birth TIME is \(String(describing: UserInfoBuilder.shared.birthTime))")
    }
    
    @objc private func timeValueChanged() {
        birthTimeField.text = formatTime(timePicker.date)
    }
    
    // MARK: - Update Progress Bar
    
    func updateProgress() {
        let progress = ProgressManager.shared.progress
        self.navigationController?.addProgressBar(progress: progress)
    }
    
    //MARK: Setup constraints
    
    private func makeConstraints() {
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        dateField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(50)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        strokeView1.snp.makeConstraints { make in
            make.top.equalTo(dateField.snp.bottomMargin).offset(4)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        birthTimeField.snp.makeConstraints { make in
            make.top.equalTo(strokeView1.snp.bottomMargin).offset(60)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        strokeView2.snp.makeConstraints { make in
            make.top.equalTo(birthTimeField.snp.bottomMargin).offset(4)
            make.height.equalTo(1)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(strokeView2.snp.bottom).offset(60)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
}
