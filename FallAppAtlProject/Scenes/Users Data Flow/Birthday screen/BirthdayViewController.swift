//
//  BirthdayViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 19.01.24.
//

import UIKit
import SnapKit

class BirthdayViewController: UIViewController, ProgressUpdateable {
    
    //MARK: Properties
    
    var coordinator: MainCoordinator?
    var mainViewController: ParentViewController?
    var builder: UserInfoBuilder?
    
    //MARK: - UI Elements

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
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme(named: .background)
        
        customizeBackButton()
        
        view.addSubview(titleLabel)
        view.addSubview(continueButton)
        view.addSubview(dateField)
        view.addSubview(strokeView1)
        view.addSubview(birthTimeField)
        view.addSubview(strokeView2)
        
        didContinueButtonTapped()
        makeConstraints()
        setupDatePicker()
        setupTimePicker()
        
        updateProgressBar(value: progressValue)
    }
    
    private func didContinueButtonTapped() {
        continueButton.buttonTappedHandler = {
            let vc = BirthCityViewController()
            vc.builder = self.builder
            vc.mainViewController = self.mainViewController
//            self.transition(from:self , to: vc, duration: 0, animations: nil)
            self.mainViewController?.add(childViewController: vc)
            self.coordinator?.navigate(to: .birthCity)
            if let birthDate = self.dateField.text,
               let birthTime = self.birthTimeField.text {
                self.builder?.birthDate = birthDate
                self.builder?.birthTime = birthTime
            }
        }
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .clear
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateValueChanged), for: .valueChanged)
    
       // dateField.becomeFirstResponder()
        
        // Set up the toolbar with a "Done" button to dismiss the picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)

        dateField.inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonTapped() {
        // Handle the "Done" button tap, you may dismiss the keyboard or perform any other action
                view.endEditing(true)
        birthTimeField.becomeFirstResponder()
    }
    
    @objc private func dateValueChanged() {
        dateField.text = formatDate(datePicker.date)
    }
    
    private func formatDate(_ date: Date) -> String {
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

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done2ButtonTapped))
        toolbar.setItems([doneButton], animated: false)

        birthTimeField.inputAccessoryView = toolbar
    }
    
    @objc private func done2ButtonTapped() {
        // Handle the "Done" button tap, you may dismiss the keyboard or perform any other action
                view.endEditing(true)
    }
    
    @objc private func timeValueChanged() {
        birthTimeField.text = formatTime(timePicker.date)
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
    }
    
    // MARK: - Setup progress bar
    
//    var mainViewController: ParentViewController? {
//        return parent as? ParentViewController
//    }
//    
    var progressValue: Float = 0.25
    
    // Call this method when a step is completed
    func updateProgressBar(value: Float) {
        mainViewController?.updateProgressBar(value: value)
    }
}
