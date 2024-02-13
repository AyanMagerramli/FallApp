//
//  MatchingResultController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 11.02.24.
//

import UIKit

class MatchingResultController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: MatchingResultViewModel
    
    // MARK: - Init
    
    init(viewModel: MatchingResultViewModel) {
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
        setupViewModel()
    }
    
    // MARK: - UI Elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HomeDetailBackground")
        image.contentMode = .scaleAspectFill
        image.frame = view.bounds
        return image
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = view.bounds
        table.delegate = self
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.allowsSelection = false
        table.backgroundColor = .clear
        table.register(MatchingResultCell.self, forCellReuseIdentifier: MatchingResultCell.identifier)
        return table
    }()
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         tableView].forEach(view.addSubview(_:))
    }
 
    // MARK: - Setup View Model
    
    private func setupViewModel() {
        self.viewModel.getMatchingResult(body: self.viewModel.body)
        
        self.viewModel.success = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

    // MARK: - Data source methods

extension MatchingResultController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchingResultCell.identifier, for: indexPath) as! MatchingResultCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        if let data = self.viewModel.result?.data {
            cell.configureCell(data: data)
        }
        return cell
    }
}

    // MARK: - Delegate methods

extension MatchingResultController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
