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

        let service = ProductsListService()
        try! service.add(productList: .init(
            id: "5",
            name: "Окей",
            products: [
                .init(
                    id: "10",
                    name: "Бананы",
                    quantity: "1 штука",
                    dateCreated: Date(),
                    isBought: false,
                    dateChanged: Date(),
                    position: 0
                )
            ],
            position: 0
        ))
        try! service.add(productList: .init(
            id: "6",
            name: "Пятерочка",
            products: [
                .init(
                    id: "11",
                    name: "Воды",
                    quantity: "5л",
                    dateCreated: Date(),
                    isBought: true,
                    dateChanged: Date(),
                    position: 0
                ),
                .init(
                    id: "12",
                    name: "Хлеб",
                    quantity: nil,
                    dateCreated: Date(),
                    isBought: true,
                    dateChanged: Date(),
                    position: 0
                ),
                .init(
                    id: "13",
                    name: "Вкусняшку",
                    quantity: nil,
                    dateCreated: Date(),
                    isBought: true,
                    dateChanged: Date(),
                    position: 0
                )
            ],
            position: 1
        ))

        window = UIWindow()
        let vc = ProductsListViewController.produce(openType: .root(service: service))
        window?.rootViewController = UINavigationController(rootViewController: vc) ~~> {
            $0.navigationBar.prefersLargeTitles = true
        }
        window?.makeKeyAndVisible()
        window?.tintColor = .systemGreen

        return true
    }

}
