//
//  TarotDetailViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit

class TarotDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var coordinator: MainCoordinator?
    
    // MARK: - UI Elements
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 400
        table.register(DetailCell.self, forCellReuseIdentifier: DetailCell.identifier)
        table.backgroundColor = .clear
        table.frame = view.bounds
        return table
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor.theme(named: .background)
        
        view.addSubview(tableView)
    }
    
    // MARK: - Setup constraints

}

    // MARK: - UITableView Data Source methods

extension TarotDetailViewController: UITableViewDataSource {
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

extension TarotDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // for now there is no navigation
    }
}
