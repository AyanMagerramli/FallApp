//
//  SettingsController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 23.02.24.
//

import UIKit

class SettingsController: UIViewController {
    
    // MARK: Properties
    
    let viewModel = SettingsViewModel()
    
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
        self.viewModel.setupSettingsOptions()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        customizeBackButton()
        navigationItem.title = "Settings"
        view.backgroundColor = .background
        view.addSubview(tableView)
    }
}

// MARK: - Table view Data Soruce

extension SettingsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.model[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        cell.configureCell(data: self.viewModel.model[indexPath.section].options[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "darkGray")
        return cell
    }
}

// MARK: - Table view Delegate

extension SettingsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.viewModel.model[indexPath.section].options[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.viewModel.model[section]
        return section.title
    }
}
