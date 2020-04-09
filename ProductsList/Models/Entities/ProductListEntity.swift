//
//  ProductListEntity.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

struct ProductListEntity: Codable {

    // MARK: - Properties

    let id: String
    var name: String
    var products: [ProductEntity]
    var position: Int

    // MARK: - Initialization

    init(id: String,
         name: String,
         products: [ProductEntity],
         position: Int) {
        self.id = id
        self.name = name
        self.products = products
        self.position = position
    }

    init(from entity: ProductListEntity, maxNumberOfProducts: Int) {
        self.id = entity.id
        self.name = entity.name
        self.products = Array(entity.products.prefix(maxNumberOfProducts))
        self.position = entity.position
    }

}
