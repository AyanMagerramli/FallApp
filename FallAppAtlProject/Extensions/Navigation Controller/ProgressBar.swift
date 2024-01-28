//
//  ProgressBar.swift
//  FallAppAtlProject
//
//  Created by Ayan on 27.01.24.
//

import UIKit

extension UINavigationController {
    
    // MARK: - Adding Progress Bar and Increasing its progress value
    
    func addProgressBar(progress: Float) {
        let progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.setProgress(progress, animated: true)
        
        // Adjust frame to fit the navigation bar
        let navBarBounds = self.navigationBar.bounds
        let progressBarWidth: CGFloat = 200 // Adjust as needed
        let xPosition = (navBarBounds.size.width - progressBarWidth) / 2
        progressBar.tintColor = .main
        progressBar.frame = CGRect(x: xPosition, y: 20, width: progressBarWidth, height: progressBar.frame.size.height)
        
        // Add progress bar to navigation bar
        self.navigationBar.addSubview(progressBar)
    }
}
