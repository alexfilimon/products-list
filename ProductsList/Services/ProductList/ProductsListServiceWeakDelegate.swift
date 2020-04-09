//
//  ProductsListServiceWeakDelegate.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

final class ProductsListServiceWeakDelegate {

    // MARK: - Properties

    weak var delegate: ProductsListServiceDelegate?

    // MARK: - Initializaion

    init(delegate: ProductsListServiceDelegate) {
        self.delegate = delegate
    }

}
