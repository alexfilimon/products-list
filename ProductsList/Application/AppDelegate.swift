//
//  AppDelegate.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let vc = UIStoryboard.instantiate(ofType: ProductsListViewController.self)!
        vc.productListService = ProductsListService()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()

        return true
    }

}
