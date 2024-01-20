//
//  ParentViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import UIKit
    
    //MARK: Progress Bar Protocol

protocol ProgressUpdateable: AnyObject {
    var mainViewController: ParentViewController? { get set }
    var progressValue: Float { get set }
    func updateProgressBar(value: Float)
}

class ParentViewController: UIViewController, ProgressUpdateable {
    
    // MARK: Properties
    
    var mainViewController: ParentViewController?
    var progressValue: Float = 0.0
    
    // MARK: - Main Elements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame = self.view.bounds
        return view
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = progressValue
        progressView.trackTintColor = .gray
        progressView.progressTintColor = UIColor(named: "mainColor")
        return progressView
    }()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.addSubview(containerView)
        
        navigationItem.titleView = progressBar
        
        showChildViewController()
    }
    
    func updateProgressBar(value: Float) {
           progressValue = value
           progressBar.progress = value
       }
    
    // MARK: - Controllers containment
    
    func showChildViewController() {
           // Embed your first child view controller
        let firstViewController = BirthdayViewController()
        firstViewController.mainViewController = self
        add(childViewController: firstViewController)
    }
    
    func add(childViewController: UIViewController & ProgressUpdateable) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
        childViewController.mainViewController = self
        updateProgressBar(value: childViewController.progressValue)
    }
}
