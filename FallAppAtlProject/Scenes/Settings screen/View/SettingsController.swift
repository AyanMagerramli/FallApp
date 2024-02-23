//
//  SettingsController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import UIKit

struct Sections {
    let title: String
    let options: [SettingsOptions]
}

struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsController: UIViewController {
    
    // MARK: Properties
    
    private var viewModel: SettingsViewModel
    var model = [Sections]()
    
    // MARK: - Init
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.frame = view.bounds
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
        table.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSettingsOptions()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        navigationItem.title = "Settings"
        
        view.backgroundColor = .background
        
        view.addSubview(tableView)
    }
    
    private func setupSettingsOptions() {
        self.model.append(Sections(title: "Information",
                                   options:
[
    SettingsOptions(title: "About us",
                    icon: UIImage(systemName: "info.circle"),
                    iconBackgroundColor: .systemGreen,
                    handler: {
            self.aboutUsAction()
        }),
    
    SettingsOptions(title: "Terms and Conditions",
                    icon: UIImage(systemName: "book"),
                    iconBackgroundColor: .systemBlue,
                    handler: {
            self.termsAndConditionsAction()
        })]))
        
        self.model.append(Sections(title: "General",
                                   options:
[
    SettingsOptions(title: "Reset password",
                    icon: UIImage(systemName: "lock"),
                    iconBackgroundColor: .systemCyan,
                    handler: {
            self.viewModel.coordinator.goToConfirmOTPScreen()
        }),
    
    SettingsOptions(title: "Logout",
                    icon: UIImage(systemName: "power"),
                    iconBackgroundColor: .systemRed,
                    handler: {
            self.logoutUser()
        })]))
    }
    
    private func logoutUser() {
        self.viewModel.logoutUser()
        
        self.viewModel.success = {
            UserDefaults.standard.set(false, forKey: "loggedIn")
        }
    }
    
    private func aboutUsAction() {
        let vc = AboutUsController()
        navigationController?.present(vc, animated: true)
    }
    
    private func termsAndConditionsAction() {
        let vc = TermsAndConditionsController()
        navigationController?.present(vc, animated: true)
    }
}

// MARK: - Table view Data Soruce

extension SettingsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        cell.configureCell(data: model[indexPath.section].options[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "darkGray")
        return cell
    }
}

// MARK: - Table view Delegate

extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = model[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = model[section]
        return section.title
    }
}
