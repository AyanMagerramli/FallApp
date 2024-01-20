//
//  CustomTitleView.swift
//  FallAppAtlProject
//
//  Created by Ayan on 20.01.24.
//

import UIKit

class CustomTitleView: UIView {
    private let numberOfSteps = 4
    private var stepViews: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let stepWidth = frame.width / CGFloat(numberOfSteps)
        for i in 0..<numberOfSteps {
            let stepView = UIView(frame: CGRect(x: CGFloat(i) * stepWidth, y: 0, width: stepWidth, height: frame.height))
            stepView.backgroundColor = UIColor.clear
            addSubview(stepView)
            stepViews.append(stepView)
        }
    }
    
    func updateStep(step: Int) {
        guard step >= 0 && step < numberOfSteps else {
            return
        }
        
        for i in 0..<step {
            stepViews[i].backgroundColor = UIColor.black
        }
    }
}
