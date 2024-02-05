//
//  ImageViewExtension.swift
//  FallAppAtlProject
//
//  Created by Ayan on 06.02.24.
//

import Foundation
import SDWebImage

extension UIImageView {
    func loadImage (url: String) {
        if let url = URL(string: url) {
            self.sd_setImage(with: url)
        }
    }
}

