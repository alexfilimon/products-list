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

    // MARK: - Private Properties

    private var delegates: [ProductsListServiceWeakDelegate] = []

    // MARK: - ProductsListAbstractService

    func getAllProductLists() throws -> [ProductListEntity] {
        return try loadProductLists()
    }

    func getProductList(for product: ProductEntity) throws -> ProductListEntity {
        let allProductLists = try getAllProductLists()
        guard
            let index = allProductLists.firstIndex(where: {
                $0.products.contains(where: { $0.id == product.id })
            })
        else {
            throw ProductsListServiceError.noListForProduct
        }
        return allProductLists[index]
    }

    func getProductList(by id: String) throws -> ProductListEntity {
        let allProductLists = try getAllProductLists()
        guard let index = allProductLists.firstIndex(where: { $0.id == id }) else {
            throw ProductsListServiceError.noListForProduct
        }
        return allProductLists[index]
    }

    func removeAll() throws {
        try saveProductLists([])
    }

    func update(product: ProductEntity) throws {
        var productList = try getProductList(for: product)
        guard let index = productList.products.firstIndex(where: { $0.id == product.id }) else { return }
        productList.products[index] = product
        try update(productList: productList)
    }

    func add(product: ProductEntity, to productList: ProductListEntity) throws {
        var actualProductList = try getProductList(by: productList.id)
        guard !actualProductList.products.contains(where: { $0.id == product.id }) else { return }
        actualProductList.products.append(product)
        try update(productList: actualProductList)
    }

    func remove(product: ProductEntity) throws {
        var productList = try getProductList(for: product)
        guard let index = productList.products.firstIndex(where: { $0.id == product.id }) else { return }
        productList.products.remove(at: index)
        try update(productList: productList)
    }

    func add(productList: ProductListEntity) throws {
        var allProductLists = try getAllProductLists()
        guard !allProductLists.contains(where: { $0.id == productList.id }) else { return }
        allProductLists.append(productList)
        try saveProductLists(allProductLists)
        notifyDelegates()
    }

    func update(productList: ProductListEntity) throws {
        var allProductLists = try getAllProductLists()
        guard let index = allProductLists.firstIndex(where: { $0.id == productList.id }) else { return }
        allProductLists[index] = productList
        try saveProductLists(allProductLists)
        notifyDelegates()
    }

    func remove(productList: ProductListEntity) throws {
        var allProductLists = try getAllProductLists()
        guard let index = allProductLists.firstIndex(where: { $0.id == productList.id }) else { return }
        allProductLists.remove(at: index)
        try saveProductLists(allProductLists)
        notifyDelegates()
    }

    func produceProductListItemService(for productList: ProductListEntity) -> ProductsListItemAbstractService {
        return ProductsListItemService(productList: productList, productListsService: self)
    }

    func addDelegate(_ delegate: ProductsListServiceDelegate) {
        normalizeDelegates()
        self.delegates.append(.init(delegate: delegate))
    }

}

// MARK: - Private Properties

private extension ProductsListService {

    func normalizeDelegates() {
        delegates.removeAll(where: { $0.delegate == nil })
    }

    func notifyDelegates() {
        normalizeDelegates()
        delegates.forEach { $0.delegate?.anyProductListServiceUpdate() }
    }

    func saveProductLists(_ productLists: [ProductListEntity]) throws {
        try LocalStorage.store(object: productLists, as: Constants.fileName)
    }

    func loadProductLists() throws -> [ProductListEntity] {
        return try LocalStorage.load(fileName: Constants.fileName, as: [ProductListEntity].self).or([])
    }

}
