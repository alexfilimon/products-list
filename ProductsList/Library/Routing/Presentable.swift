//
//  Presentable.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

/// Describes object that can be presented in view hierarchy
protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }

}
