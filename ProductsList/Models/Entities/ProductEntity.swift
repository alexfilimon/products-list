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
    let name: String
    let quantity: String?
    let dateCreated: Date
    let isBought: Bool
    let dateChanged: Date
    let position: Int
}
