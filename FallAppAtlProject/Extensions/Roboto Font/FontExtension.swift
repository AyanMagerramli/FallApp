//
//  FontExtension.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import UIKit

extension UIFont {
    static func robotoFont(ofType type: RobotoFont, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

