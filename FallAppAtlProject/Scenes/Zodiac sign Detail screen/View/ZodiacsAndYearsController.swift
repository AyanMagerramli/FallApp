//
//  ZodiacSignDetailViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit

class ZodiacsAndYearsController: UIViewController {
    
    // MARK: Properties

    
    // MARK: - UI Elements
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.frame = view.bounds
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "zodiacDetailBackground")
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
        view.backgroundColor = .clear
        
        view.sendSubviewToBack(backgroundImage)
        
        [backgroundImage,
         tableView].forEach(view.addSubview(_:))
    }
}

// MARK: - UITableView Data Source methods

extension ZodiacsAndYearsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as! DetailCell
     //   cell.configureCell()
        return cell
    }
}

// MARK: - UITableView Delegate methods

extension ZodiacsAndYearsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // for now there is no navigation
    }
}
