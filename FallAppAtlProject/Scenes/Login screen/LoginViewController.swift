//
//  LoginViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 12.01.24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        didUserLogin()
    }
    
    private func didUserLogin() {
        UserDefaults.standard.setValue(true, forKey: "Logged in")   
    }
}
