//
//  NavigationBackButton.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import Foundation
import UIKit

extension UIViewController {

    func customizeBackButton() {
        // Customize the appearance of the back button
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        // Set the back button appearance
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        // Add a custom back button icon if needed
        let backButtonImage = UIImage(named: "backButton")?.withRenderingMode(.alwaysTemplate)
        navigationController?.navigationBar.backIndicatorImage = backButtonImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        
        // Set an empty title for the back button in the previous view controller
        navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.backItem?.title = ""

        // Customize the back button text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
