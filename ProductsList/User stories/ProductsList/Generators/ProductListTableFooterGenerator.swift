//
//  ProductListTableFooterGenerator.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import ReactiveDataDisplayManager

final class ProductListTableFooterGenerator: TableHeaderGenerator {

    // MARK: - Private Properties

    private lazy var view = ProductListTableFooterView()

    // MARK: - Initializaion

    init(text: String) {
        super.init()
        view.configure(text: text)
    }

    // MARK: - Methods

    func configure(text: String) {
        view.configure(text: text)
    }

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        return view
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return 20
    }

}
