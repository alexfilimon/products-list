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
    func getProductList(for product: ProductEntity) throws -> ProductListEntity
    func getProductList(by id: String) throws -> ProductListEntity
    func removeAll() throws

    func update(product: ProductEntity) throws
    func add(product: ProductEntity, to productList: ProductListEntity) throws
    func remove(product: ProductEntity) throws

    func add(productList: ProductListEntity) throws
    func update(productList: ProductListEntity) throws
    func remove(productList: ProductListEntity) throws

    func produceProductListItemService(for productList: ProductListEntity) -> ProductsListItemAbstractService
    func addDelegate(_ delegate: ProductsListServiceDelegate)
}
