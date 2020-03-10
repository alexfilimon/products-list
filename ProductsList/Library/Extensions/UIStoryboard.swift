//
//  UIStoryboard.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

extension UIStoryboard {

    /// Instant Initial View Controller of the same storyboard name
    static func instantiate<ViewController: UIViewController>(ofType: ViewController.Type) -> ViewController? {
        let storyboard = UIStoryboard(name: String(describing: ViewController.self), bundle: Bundle.main)
        return storyboard.instantiateInitialViewController() as? ViewController
    }

}
