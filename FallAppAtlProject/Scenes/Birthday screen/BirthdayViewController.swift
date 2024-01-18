//
//  BirthdayViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 19.01.24.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    //MARK: Properties
    
    //MARK: - UI Elements
    
    private lazy var continueButton: UIButton = {
      let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = .systemFont(ofSize: <#T##CGFloat#>)
        button.backgroundColor = UIColor(named: "mainColor")
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
