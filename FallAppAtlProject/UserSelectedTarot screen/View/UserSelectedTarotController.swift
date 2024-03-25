//
//  UserSelectedTarotController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 24.03.24.
//

import UIKit

class UserSelectedTarotController: UIViewController {
    
    // MARK: Properties
    
    private let viewModel = UserSelectedTarotViewModel()
    
    // MARK: - UI Elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.frame = view.bounds
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "selectedTarotBackground")
        return image
    }()
    
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .clear
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         tableView].forEach(view.addSubview)
        
    }
    
    private func setupViewModel() {
        self.viewModel.getSelectedTarotInfo()
        
        self.viewModel.success = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

    // MARK: - Table View Data Source methods

extension UserSelectedTarotController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if let tarot = self.viewModel.selectedTarot?.card {
            cell.configureCell(data: tarot)
        }
        return cell
    }
}

    // MARK: - Table View Delegate methods

extension UserSelectedTarotController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
