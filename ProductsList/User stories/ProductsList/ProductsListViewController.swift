//
//  ProductsListViewController.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class ProductsListViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var productListService: ProductsListAbstractService!

    // MARK: - Private Properties

    private lazy var adapter = BaseTableDataDisplayManager(collection: tableView)

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        fillAdapter()
    }

}

// MARK: - Appearance

private extension ProductsListViewController {

    func configureAppearance() {
        configureNavigationItem()
        configureTableView()
    }

    func configureNavigationItem() {
        navigationItem.title = "Some"
    }

    func configureTableView() {
        tableView.separatorStyle = .none
    }

}

// MARK: - Private Properties

private extension ProductsListViewController {

    func fillAdapter() {
        adapter.clearCellGenerators()
        adapter.clearHeaderGenerators()

        let generator = BaseTableCellGenerator<ProductsListItemTableCell>(with: .init(title: "Hello"))
        adapter.addCellGenerator(generator)

        adapter.forceRefill()
    }

}
