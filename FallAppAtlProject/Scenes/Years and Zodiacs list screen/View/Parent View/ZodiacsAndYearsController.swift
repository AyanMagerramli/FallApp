//
//  YearAndZodiacSignsViewController.swift
//  FallAppAtlProject
//
//  Created by Ayan on 26.01.24.
//

import UIKit
import SnapKit

class ZodiacsAndYearsController: UIViewController {
    
    // MARK: Properties
    
    let viewModel = ZodiacsAndYearsViewModel()
    
    // Child View Controllers:
    let firstVC = ZodiacsController()
    let secondVC = YearsController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
        setupSegmentControl()
    }
    
    // MARK: - Setup Child View Controllers
    
    private func setupChildController() {
        
        firstVC.viewModel.coordinator = self.viewModel.coordinator
        secondVC.viewModel.coordinator = self.viewModel.coordinator
        
        [firstVC,
         secondVC].forEach(addChild(_:))
        
        [firstVC.view,
         secondVC.view].forEach(self.view.addSubview(_:))
        
        firstVC.didMove(toParent: self)
        secondVC.didMove(toParent: self)
        
        firstVC.view.frame = self.view.bounds
        secondVC.view.frame = self.view.bounds
        secondVC.view.isHidden = true
    }
    
    private func setupSegmentControl() {
        // Create UISegmentedControl
        let segmentedControl = UISegmentedControl(items: ["Zoadiacs", "Yeers"])
        segmentedControl.selectedSegmentIndex = 0 // Select the first segment initially
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        // Set tint color for the selected segment tab
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        segmentedControl.backgroundColor = .clear
        
        // Set background images for the segments
        segmentedControl.setBackgroundImage(createImageWithColor(color: .white), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(createImageWithColor(color: .main), for: .selected, barMetrics: .default)
        
        // Function to create a UIImage with a solid color
        func createImageWithColor(color: UIColor) -> UIImage {
            let rect = CGRect(x: 0, y: 0, width: 1, height: 32) // Adjust height as needed
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
            color.setFill()
            UIRectFill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return image
        }
        
        // Set segmentedControl as the title view of the navigation item
        navigationItem.titleView = segmentedControl
        
        // Update navigation bar appearance
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        self.firstVC.view.isHidden = true
        self.secondVC.view.isHidden = true
        
        // Handle segmented control value changed event
        switch sender.selectedSegmentIndex {
        case 0:
            // Handle tab 1 selection
            firstVC.view.isHidden = false
        case 1:
            // Handle tab 2 selection
            secondVC.view.isHidden = false
        default:
            break
        }
    }
}
