//
//  ProductListEntity.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

struct ProductListEntity: Codable {
    let id: String
    let name: String
    let products: [ProductEntity]
    let position: Int
}
