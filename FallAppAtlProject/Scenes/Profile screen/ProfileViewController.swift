//
//  ProfileViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 400
        table.backgroundColor = .clear
        table.frame = view.bounds
        return table
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - setup UI
    
    private func setupUI() {
        view.addSubview(tableView)
        
        makeConstraints()
    }
    
    // MARK: - setup Constraints
    
    private func makeConstraints() {
        
    }
}

// MARK: - UITableView Data Source methods

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        cell.configureCell()
        return cell
    }
}

// MARK: - UITableView Delegate methods

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // for now there is no navigation
    }
}
