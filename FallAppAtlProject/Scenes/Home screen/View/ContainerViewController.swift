//
//  ContainerViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 09.02.24.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opened
        case closed
    }
    
    // MARK: Properties
    
    private var menuState: MenuState = .closed
    let viewModel = HomeViewModel()
    
    // Child View Controllers:
    let homeVc = HomeViewController()
    let menuVc = SideMenuController()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
    }
    
    // MARK: - Setup Child View Controllers
    
    private func setupChildController() {
        
        homeVc.viewModel.coordinator = self.viewModel.coordinator
        //secondVC.viewModel.coordinator = self.viewModel.coordinator
        
        [homeVc,
         menuVc].forEach(addChild(_:))
        
        self.view.addSubview(homeVc.view ?? UIView())
        self.view.addSubview(menuVc.view)
        
      //  firstVC.didMove(toParent: self)
        homeVc.didMove(toParent: self)
        menuVc.didMove(toParent: self)
        
        homeVc.delegate = self
    }
}

// MARK: - Home Delegate confromance

extension ContainerViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        switch menuState {
        case .opened:
            // close menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.homeVc.view.frame.origin.x = 0
            } completion: { done in
                if done {
                    self.menuState = .closed
                    print("Menu closed")
                }
            }
        case .closed:
            // open menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.homeVc.view.frame.origin.x = self.homeVc.view.frame.size.width - 100
            } completion: { done in
                if done {
                    self.menuState = .opened
                    print("Menu opened")
                }
            }
        }
    }
}
