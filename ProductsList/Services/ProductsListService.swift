//
//  ProductsListService.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation
import SurfUtils

final class ProductsListService: ProductsListAbstractService {

    // MARK: - Constants

    private enum Constants {
        static let fileName = "products_list.json"
    }

    // MARK: - ProductsListAbstractService

    func getAllProductLists() throws -> [ProductListEntity] {
        return try LocalStorage.load(fileName: Constants.fileName, as: [ProductListEntity].self).or([])
    }

    func saveProductLists(_ productLists: [ProductListEntity]) throws {
        try LocalStorage.store(object: productLists, as: Constants.fileName)
    }

}
