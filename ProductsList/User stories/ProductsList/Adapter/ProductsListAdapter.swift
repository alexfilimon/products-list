//
//  ProductsListAdapter.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import ReactiveDataDisplayManager

final class ProductsListAdapter {

    // MARK: - Properties

    var onOpenProductsList: Closure<ProductListEntity>?
    var onRemoveProduct: Closure<ProductEntity>?
    var onProductSelected: Closure<(product: ProductEntity, isChecked: Bool)>?

    // MARK: - Private Properties

    private let adapter: ActionableTableDataDisplayManager

    // MARK: - Initializaion

    init(tableView: UITableView) {
        self.adapter = .init(collection: tableView)
    }

    // MARK: - Configure

    func configure(productsLists: [ProductListEntity],
                   needSectionHeader: Bool,
                   needLimit: Bool) {
        adapter.clearCellGenerators()
        adapter.clearHeaderGenerators()

        adapter.addSectionHeaderGenerator(EmptyTableHeaderGenerator())
        adapter.addCellGenerator(EmptyHeightTableCellGenerator(height: 20))

        let lists = productsLists
        lists
            .map {
                needLimit
                    ? (entity: ProductListEntity(from: $0, maxNumberOfProducts: 3), count: $0.products.count)
                    : (entity: $0, count: $0.products.count)
            }
            .forEach { productList, count in
            if needSectionHeader {
                let header = ProductListTableHeaderGenerator(title: productList.name)
                header.onAction = weak(self) { $0.onOpenProductsList?(productList) }
                adapter.addSectionHeaderGenerator(header)
            } else {
                adapter.addSectionHeaderGenerator(EmptyTableHeaderGenerator())
            }

            let footerGenerator = ProductListTableFooterGenerator(text: "\(count) шт.")

            productList.products.forEach { product in
                let generator = ProductListItemCellGenerator(model: getViewModel(for: product))
                generator.didSelectEvent += weak(self, generator) { `self`, generator, _ in
                    var newModel = generator.model
                    newModel.isChecked.toggle()
                    generator.update(model: newModel)
                    self.onProductSelected?((product: product, isChecked: newModel.isChecked))
                }
                generator.didRemoveEvent += weak(self) {
                    $0.onRemoveProduct?(product)
                }
                adapter.addCellGenerator(generator)
            }
            if productList.products.isEmpty {
                adapter.addCellGenerator(EmptyHeightTableCellGenerator(height: 0.01))
            }

            adapter.addSectionHeaderGenerator(footerGenerator)
            adapter.addCellGenerator(EmptyHeightTableCellGenerator(height: 0.01))
        }

        adapter.forceRefill()
    }

}

// MARK: - Private Methods

private extension ProductsListAdapter {

    func getViewModel(for product: ProductEntity) -> ProductsListItemTableCellModel {
        return .init(title: product.name,
                     quantity: product.quantity,
                     isChecked: product.isBought)
    }

}
