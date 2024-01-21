//
//  ParentViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import UIKit

// MARK: - Progress Bar Protocol

protocol ProgressUpdateable: AnyObject {
    var progressValue: Float { get set }
    func updateProgressBar(value: Float)
}

// MARK: - Parent View Controller

class ParentViewController: UIViewController, ProgressUpdateable {
    
    // MARK: - Properties
    
    var progressValue: Float = 0.0 {
        didSet {
            updateProgressBar(value: progressValue)
        }
    }
    
    // MARK: - Main Elements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame = self.view.bounds
        return view
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = UIColor(named: "mainColor")
        return progressView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showChildViewController()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.addSubview(containerView)
        navigationItem.titleView = progressBar
    }
    
    // MARK: - Controllers Containment
    
    func showChildViewController() {
        // Embed your first child view controller
        let firstViewController = BirthdayViewController()
        add(childViewController: firstViewController)
    }
    
    func add(childViewController: UIViewController & ProgressUpdateable) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
        childViewController.updateProgressBar(value: childViewController.progressValue)
    }
    
    // MARK: - ProgressUpdateable method
    
    func updateProgressBar(value: Float) {
        progressBar.progress = value
    }
}
