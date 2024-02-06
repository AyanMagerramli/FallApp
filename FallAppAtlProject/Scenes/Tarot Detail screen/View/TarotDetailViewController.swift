//
//  TarotDetailViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit

class TarotDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: TarotDetailViewModel
    
    // MARK: - Init
    
    init(viewModel: TarotDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.frame = view.bounds
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "tarotDetailBackground")
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
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .clear
        
        [backgroundImage,
         tableView].forEach(view.addSubview(_:))
        
        view.sendSubviewToBack(backgroundImage)
    }
    
    private func setupViewModel() {
        self.viewModel.getTarotDetailedInfo()
        
        self.viewModel.success = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

    // MARK: - UITableView Data Source methods

extension TarotDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        if let tarotDetail = viewModel.tarotDetail {
            cell.configureTarotDetailCell(data: tarotDetail)
        }
        return cell
    }
}
    
    // MARK: - UITableView Delegate methods

extension TarotDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // for now there is no navigation
    }
}
