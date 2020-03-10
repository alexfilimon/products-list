//
//  UIImage.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

extension UIImage {

    func resizedImage(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale

        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 0)
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? UIImage()
    }

    func resizedImage(newHeight: CGFloat) -> UIImage {
        let scale = newHeight / self.size.height
        let newWidth = self.size.width * scale

        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 0)
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? UIImage()
    }

    class func imageWithColor(_ color: UIColor, of size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        // need to disable warning here, cause in other way we can't get nonoptional output,
        // and here we guarantee nonnil value.
        // swiftlint:disable force_unwrapping
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // swiftlint:enable force_unwrapping
        UIGraphicsEndImageContext()
        return image
    }

    func tintColored() -> UIImage {
        return withRenderingMode(.alwaysTemplate)
    }

}
