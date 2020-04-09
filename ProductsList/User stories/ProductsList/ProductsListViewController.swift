//
//  ProductsListViewController.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager
import BLTNBoard

final class ProductsListViewController: UIViewController {

    // MARK: - Nested Types

    enum OpenType {
        case root(service: ProductsListAbstractService)
        case list(title: String, service: ProductsListItemAbstractService)

        // MARK: - Properties

        var needSectionHeader: Bool {
            guard case .root = self else {
                return false
            }
            return true
        }

        var needLimit: Bool {
            guard case .root = self else {
                return false
            }
            return true
        }
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private Properties

    private lazy var adapter = ProductsListAdapter(tableView: tableView)
    private var openType: OpenType!
    private lazy var addProductListManager: BLTNItemManager = {
        let rootItem = BLTNPageInput(title: "Добавление списка",
                                     description: "Введите название",
                                     placeholder: "Пятерочка")
        rootItem.isDismissable = true
        rootItem.requiresCloseButton = false
        rootItem.actionButtonTitle = "Добавить"
        rootItem.actionHandler = weak(self) {
            let value = ($1 as? BLTNPageInput)?.titleInputValue
            $0.addProductList(title: value)
            $1.manager?.dismissBulletin()
        }
        rootItem.appearance = BulletsConstants.appearance

        let manager = BLTNItemManager(rootItem: rootItem)
        manager.backgroundViewStyle = BulletsConstants.backgroundStyle
        return manager
    }()
    private lazy var addProductManager: BLTNItemManager = {
        var title: String?
        var description: String?

        let rootItem = BLTNPageInput(title: "Добавление продукта",
                                     description: "Введите название",
                                     placeholder: "Апельсин")
        rootItem.isDismissable = true
        rootItem.requiresCloseButton = false
        rootItem.actionButtonTitle = "Далее"
        rootItem.actionHandler = weak(self) {
            title = ($1 as? BLTNPageInput)?.titleInputValue
            $1.manager?.displayNextItem()
        }
        rootItem.appearance = BulletsConstants.appearance

        let quantityItem = BLTNPageInput(title: "Добавление продукта",
                                         description: "Введите количество",
                                         placeholder: "3 шт")
        quantityItem.isDismissable = true
        quantityItem.requiresCloseButton = false
        quantityItem.actionButtonTitle = "Готово"
        quantityItem.actionHandler = weak(self) {
            description = ($1 as? BLTNPageInput)?.titleInputValue
            $0.addProductItem(title: title, quantity: description)
            $1.manager?.dismissBulletin()
        }
        quantityItem.appearance = BulletsConstants.appearance

        rootItem.next = quantityItem
        let manager = BLTNItemManager(rootItem: rootItem)
        manager.backgroundViewStyle = BulletsConstants.backgroundStyle
        return manager
    }()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        fillAdapter()
    }

    // MARK: - Configure

    static func produce(openType: OpenType) -> Self {
        let vc = UIStoryboard.instantiate(ofType: Self.self)!
        vc.openType = openType
        return vc
    }

}

// MARK: - Appearance

private extension ProductsListViewController {

    func configureAppearance() {
        configureNavigationItem()
        configureAdapter()
        switch openType {
        case .list(_, let service):
            service.addDelegate(self)
        case .root(let service):
            service.addDelegate(self)
        case .none:
            break
        }
    }

    func configureNavigationItem() {
        switch openType {
        case .list(let title, _):
            navigationItem.title = title
            navigationItem.largeTitleDisplayMode = .never
            navigationItem.rightBarButtonItems = [
                .init(image: UIImage(systemName: "plus"),
                      style: .plain,
                      target: self,
                      action: #selector(handleAdd)),
                .init(image: UIImage(systemName: "trash"),
                      style: .plain,
                      target: self,
                      action: #selector(handleRemove))
            ]
        case .root:
            navigationItem.title = "Списки"
            navigationItem.largeTitleDisplayMode = .always
            navigationItem.rightBarButtonItems = [
                .init(image: UIImage(systemName: "plus"),
                      style: .plain,
                      target: self,
                      action: #selector(handleAdd))
            ]
        case .none:
            break
        }

    }

    func configureAdapter() {
        adapter.onOpenProductsList = weak(self) { $0.goToListScreen(productList: $1) }
        adapter.onProductSelected = weak(self) {
            var newProduct = $1.product
            newProduct.isBought = $1.isChecked

            switch $0.openType {
            case .list(_, let service):
                try? service.update(product: newProduct)
            case .root(let service):
                try? service.update(product: newProduct)
            case .none:
                break
            }
        }
        adapter.onRemoveProduct = weak(self) {
            switch $0.openType {
            case .list(_, let service):
                try? service.remove(product: $1)
            case .root(let service):
                try? service.remove(product: $1)
            case .none:
                break
            }
        }
    }

}

// MARK: - Actions

private extension ProductsListViewController {

    @objc
    func handleAdd() {
        switch openType {
        case .list:
            addProductManager.showBulletin(above: self)
        case .root:
            addProductListManager.showBulletin(above: self)
        case .none:
            break
        }
    }

    @objc
    func handleRemove() {
        switch openType {
        case .list(_, let service):
            try? service.remove()
            MainRouter.shared.popModule()
        case .root, .none:
            break
        }
    }

}

// MARK: - ProductsListServiceDelegate

extension ProductsListViewController: ProductsListServiceDelegate {

    func anyProductListServiceUpdate() {
        fillAdapter()
    }

}

// MARK: - Private Properties

private extension ProductsListViewController {

    func getProductsList() -> [ProductListEntity] {
        switch openType {
        case .list(_, let service):
            return [try? service.getProductList()].compactMap { $0 }
        case .root(let service):
            return (try? service.getAllProductLists()) ?? []
        case .none:
            return []
        }
    }

    func fillAdapter() {
        adapter.configure(productsLists: getProductsList(),
                          needSectionHeader: openType.needSectionHeader,
                          needLimit: openType.needLimit)
    }

    func addProductList(title: String?) {
        guard let title = title else { return }
        switch openType {
        case .root(let service):
            let productList = ProductListEntity(id: UUID().uuidString,
                                                name: title,
                                                products: [],
                                                position: 0)
            try? service.add(productList: productList)
        case .list, .none:
            break
        }
    }

    func addProductItem(title: String?, quantity: String?) {
        guard let title = title else { return }
        switch openType {
        case .list(_, let service):
            let product = ProductEntity(id: UUID().uuidString,
                                        name: title,
                                        quantity: quantity,
                                        dateCreated: Date(),
                                        isBought: false,
                                        dateChanged: Date(),
                                        position: 0)
            try? service.add(product: product)
        case .root, .none:
            break
        }
    }

}

// MARK: - Routing Methods

private extension ProductsListViewController {

    func goToListScreen(productList: ProductListEntity) {
        guard case let .root(listService) = openType else {
            return
        }
        let listItemService = listService.produceProductListItemService(for: productList)
        let vc = ProductsListViewController.produce(openType: .list(title: productList.name,
                                                                    service: listItemService))
        MainRouter.shared.push(vc)
    }

}
