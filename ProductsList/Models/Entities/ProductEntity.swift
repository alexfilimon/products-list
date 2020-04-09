//
//  ProductEntity.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

struct ProductEntity: Codable {
    let id: String
    var name: String
    var quantity: String?
    let dateCreated: Date
    var isBought: Bool
    var dateChanged: Date
    var position: Int
}
