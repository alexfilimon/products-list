//
//  ProductsListItemAbstractService.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

protocol ProductsListItemAbstractService {
    func addDelegate(_ delegate: ProductsListServiceDelegate)
    func getProductList() throws -> ProductListEntity
    func update(product: ProductEntity) throws
    func add(product: ProductEntity) throws
    func remove(product: ProductEntity) throws
    func remove() throws
}
