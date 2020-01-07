//
//  UIImage+Sizing.swift
//  Core
//
//  Created by Michael Lee on 1/6/20.
//

import UIKit

// MARK: - Used to scale UIImages
extension UIImage {
    func scaleTo(_ newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}
