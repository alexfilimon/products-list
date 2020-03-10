//
//  ProductsListAbstractService.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

protocol ProductsListAbstractService {
    func getAllProductLists() throws -> [ProductListEntity]
    func saveProductLists(_ productLists: [ProductListEntity]) throws
}
