//
//  SelectedTarotDetailController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 28.02.24.
//

import UIKit

class SelectedTarotDetailController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: SelectedTarotDetailViewModel
    var body: TarotSelectionRequestModel?
    
    // MARK: - Init
    
    init(viewModel: SelectedTarotDetailViewModel) {
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
         tableView].forEach(view.addSubview)
        
        view.sendSubviewToBack(backgroundImage)
    }
    
    // MARK: - Setup view model
    
    private func setupViewModel() {
        body = TarotSelectionRequestModel(id: self.viewModel.tarotId)
        if let body = body {
            viewModel.selectTarotCard(body: body)
        }
        
        viewModel.success = { [weak self] in
            self?.tableView.reloadData()
            StoredSelectedTarotInfo.shared.tarotImage = self?.viewModel.selectedTarot?.backImage
            if let info = self?.viewModel.selectedTarot?.generalInfo,
               let forecast = self?.viewModel.selectedTarot?.forecast {
                StoredSelectedTarotInfo.shared.tarotInf0 = "\(info) \(forecast)"
            }
        }
    }
}

// MARK: - UITableView Data Source methods

extension SelectedTarotDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        if let tarot = self.viewModel.selectedTarot {
            cell.configureCell(data: tarot)
        }
        return cell
    }
}

// MARK: - UITableView Delegate methods

extension SelectedTarotDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // for now there is no navigation
    }
}
