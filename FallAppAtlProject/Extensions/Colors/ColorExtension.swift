//
//  ColorExtension.swift
//  FallAppAtlProject
//
//  Created by Ayan on 21.01.24.
//

import UIKit

extension UIColor {
    static func theme (named color : Color) -> UIColor {
        return UIColor(named: color.rawValue) ?? UIColor.yellow
    }
}

