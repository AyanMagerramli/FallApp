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
    
    var viewModel: ProfileViewModel
    let headerView = UserInfoHeader()
    
    // MARK: - Init
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    
    private lazy var backgrounImage: UIImageView = {
        let image = UIImageView()
        image.frame = view.bounds
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "yearSignsBackground")
        return image
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(ZodiacAndYearSignAboutCell.self, forCellReuseIdentifier: ZodiacAndYearSignAboutCell.identifier)
        table.register(SectionSpaceFooter.self, forHeaderFooterViewReuseIdentifier: SectionSpaceFooter.identifier)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 400
        table.backgroundColor = .clear
        table.frame = view.bounds
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.separatorStyle = .none
        // Add a header view to the table view
        return table
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModelSetup()
    }
    
    // MARK: - setup UI
    
    private func setupUI() {
        
        view.sendSubviewToBack(backgrounImage)
        
        [backgrounImage,
         tableView].forEach(view.addSubview)
        
        makeConstraints()
        
        setupHeader()
    }
    
    private func setupHeader () {
        headerView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 190)
        tableView.tableHeaderView = headerView
    }
    
    // MARK: - Setup Constraints
    
    private func makeConstraints() {
        
    }
    
    // MARK: - Setup View Model
    
    private func viewModelSetup() {
        self.viewModel.getUserProfile()
        
        self.viewModel.success = { [weak self] in
            self?.tableView.reloadData()
            DispatchQueue.main.async {
                if let profile = self?.viewModel.profileModel?.data?.profile {
                    self?.headerView.configureHeader(data: profile)
                    self?.navigationItem.title = "My Profile"
                }
            }
        }
    }
}

// MARK: - UITableView Data Source methods

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionSpaceFooter.identifier) as! SectionSpaceFooter
        footer.backgroundColor = .clear
        footer.contentView.backgroundColor = .clear
        return footer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ZodiacAndYearSignAboutCell.identifier, for: indexPath) as! ZodiacAndYearSignAboutCell
        switch indexPath.section {
        case 0:
            cell.configureCell(data: self.viewModel.profileModel?.data?.generalInfo?.items?[0],
                               title: "Your Zodiac Sign")
        case 1:
            cell.configureCell(data: self.viewModel.profileModel?.data?.generalInfo?.items?[1],
                               title: "Your Year Sign")
        case 2:
            cell.configureCell(data: self.viewModel.profileModel?.data?.generalInfo?.items?[2],
                               title: "Your Ascendant Sign")
        default:
            break
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
}

// MARK: - UITableView Delegate methods

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // for now there is no navigation
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        20
    }
}
