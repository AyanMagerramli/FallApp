//
//  HomeDetailController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import UIKit

class HomeDetailController: UIViewController {
    
    // MARK: Properties
    
    private let viewModel = HomeDetailViewModel()
    
    // MARK: - UI views
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HomeDetailBackground")
        image.contentMode = .scaleAspectFill
        image.frame = view.bounds
        return image
    }()
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table.backgroundColor = .clear
        table.frame = view.bounds
        table.estimatedRowHeight = 400
        table.rowHeight = UITableView.automaticDimension
        table.dataSource = self
        table.delegate = self
        table.register(DetailCell.self, forCellReuseIdentifier: DetailCell.identifier)
        return table
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         tableView].forEach(view.addSubview(_:))
    }
    
    // MARK: - Setup View Model
    
    private func setupViewModel() {
        viewModel.loadUserZodiacSignPredictions()
        
        viewModel.success = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.error = { [weak self] error in
            // implementation of an event when error occured
        }
    }
}

// MARK: - Table View Data Source methods

extension HomeDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1 // only one row for detail describtion
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        return cell
    }
}

// MARK: - Table View Delegate methods

extension HomeDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
