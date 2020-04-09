//
//  ProductListTableHeaderGenerator.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import ReactiveDataDisplayManager

final class ProductListTableHeaderGenerator: TableHeaderGenerator {

    // MARK: - Properties

    var onAction: EmptyClosure?

    // MARK: - Private Properties

    private lazy var view = ProductListTableHeaderView() ~~> { view in
        view.onAction = { [weak self] in
            self?.onAction?()
        }
    }

    // MARK: - Initializaion

    init(title: String) {
        super.init()
        view.configure(title: title)
    }

    // MARK: - Methods

    func configure(title: String) {
        view.configure(title: title)
    }

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        return view
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return 35
    }

}
