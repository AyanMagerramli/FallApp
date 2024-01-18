//
//  ReusableButton.swift
//  FallAppAtlProject
//
//  Created by Ayan on 19.01.24.
//

import Foundation
import UIKit
import SnapKit

class ReusableButton: UIButton {
    
    // Closure for button tap action
    var buttonTappedHandler: (() -> Void)?
    
    // MARK: - Initialization
    
    init(title: String, frame: CGRect = .init(x: 0, y: 0, width: 342, height: 48), font: UIFont = UIFont.systemFont(ofSize: 16), backgroundColor: UIColor = UIColor(named: "mainColor") ?? .systemBlue, cornerRadius: CGFloat = 24) {
        super.init(frame: frame)
        setupButton(title: title, frame: frame, font: font, backgroundColor: backgroundColor, cornerRadius: cornerRadius)
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton(title: "",frame: .zero, font: UIFont.systemFont(ofSize: 16), backgroundColor: UIColor(named: "mainColor") ?? .systemBlue, cornerRadius: 24)
        makeConstraints()
    }
    
    // MARK: - Setup
    
    private func setupButton(title: String, frame: CGRect, font: UIFont, backgroundColor: UIColor, cornerRadius: CGFloat) {
        // Customize the button appearance
        setTitleColor(.white, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        self.frame = frame
        // Set title and font
        setTitle(title, for: .normal)
        titleLabel?.font = font
        
        // Add target for touchUpInside event
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Action
    
    @objc private func buttonTapped() {
        buttonTappedHandler?()
    }
    
    private func makeConstraints() {
        snp.makeConstraints { make in
            make.width.equalTo(342)
            make.height.equalTo(48)
        }
    }
}
