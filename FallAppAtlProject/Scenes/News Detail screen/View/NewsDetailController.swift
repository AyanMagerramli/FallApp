//
//  NewsDetailController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 17.02.24.
//

import UIKit

class NewsDetailController: UIViewController {
    
    // MARK: Properties

    var viewModel: NewsDetailViewModel
    
    // MARK: - Init
    
    init(newsDetailViewModel: NewsDetailViewModel) {
        self.viewModel = newsDetailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Views
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage (named: "zodiacDetailBackground")
        image.contentMode = .scaleAspectFill
        image.frame = view.bounds
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
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         tableView].forEach(view.addSubview)
        
        customizeBackButton()
    }
}

    // MARK: Table View Data Source methods

extension NewsDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
        cell.configureCell(data: self.viewModel.selectedItem)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        return cell
    }
}

    // MARK: Table View Delegate methods

extension NewsDetailController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
