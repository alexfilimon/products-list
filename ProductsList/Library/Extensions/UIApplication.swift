//
//  UIApplication.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

extension UIApplication {

    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }

    class func topViewController(
        _ controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
    ) -> UIViewController? {

        if let navigationController = controller as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }

        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }

        if let presented = controller?.presentedViewController {
            return topViewController(presented)
        }

        return controller
    }

    func openApplicationSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        UIApplication.shared.open(url)
    }

}
