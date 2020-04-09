//
//  ProductsListItemService.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

final class ProductsListItemService: ProductsListItemAbstractService {

    // MARK: - Private Properties

    private let productList: ProductListEntity
    private let productListsService: ProductsListAbstractService

    // MARK: - Initialization

    init(productList: ProductListEntity, productListsService: ProductsListAbstractService) {
        self.productList = productList
        self.productListsService = productListsService
    }

    // MARK: - ProductsListItemAbstractService

    func getProductList() throws -> ProductListEntity {
        return try productListsService.getProductList(by: productList.id)
    }

    func update(product: ProductEntity) throws {
        try productListsService.update(product: product)
    }

    func add(product: ProductEntity) throws {
        try productListsService.add(product: product, to: productList)
    }

    func remove(product: ProductEntity) throws {
        try productListsService.remove(product: product)
    }

    func addDelegate(_ delegate: ProductsListServiceDelegate) {
        productListsService.addDelegate(delegate)
    }

    func remove() throws {
        try productListsService.remove(productList: productList)
    }

}
