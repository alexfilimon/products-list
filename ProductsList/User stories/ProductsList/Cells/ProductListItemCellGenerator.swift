//
//  ProductListItemCellGenerator.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 09/04/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import ReactiveDataDisplayManager

final class ProductListItemCellGenerator: SelectableItem, SwipeActionableGenerator {

    // MARK: - Properties

    let model: ProductsListItemTableCellModel
    var didSelectEvent = BaseEvent<Void>()
    var didRemoveEvent = BaseEvent<Void>()
    lazy var view: ProductsListItemTableCell? = {
        return ProductsListItemTableCell.fromXib()
    }()

    // MARK: - Initialization

    init(model: ProductsListItemTableCellModel) {
        self.model = model
    }

    // MARK: - Methods

    func update(model: ProductsListItemTableCellModel) {
        view?.configure(with: model)
    }

    // MARK: - SwipeActionableGenerator

    func getLeadingActions() -> [UIContextualAction] {
        return []
    }

    func getTrailingActions() -> [UIContextualAction] {
        let removeAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (_, _, completed) in
            let alertController = UIAlertController(
                title: "Внимание",
                message: "Вы действительно хотите удалить элемент?",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { [weak self] (_) in
                self?.didRemoveEvent.invoke(with: ())
                completed(true)
            }))
            alertController.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { (_) in
                completed(false)
            }))
            MainRouter.shared.present(alertController)
        }
        return [removeAction]
    }

}

// MARK: - TableCellGenerator

extension ProductListItemCellGenerator: TableCellGenerator {

    var identifier: UITableViewCell.Type {
        return ProductsListItemTableCell.self
    }

    func generate(tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard let view = view else {
            return UITableViewCell()
        }
        build(view: view)
        return view
    }

}

// MARK: - ViewBuilder

extension ProductListItemCellGenerator: ViewBuilder {

    func build(view: ProductsListItemTableCell) {
        view.configure(with: model)
    }

}
