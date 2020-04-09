//
//  EmptyHeightTableCellGenerator.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import ReactiveDataDisplayManager

/// RDDM generator for empty height cell
public final class EmptyHeightTableCellGenerator {

    // MARK: - Properties

    private let height: CGFloat

    // MARK: - Initialization

    public init(height: CGFloat) {
        self.height = height
    }

}

// MARK: - TableCellGenerator

extension EmptyHeightTableCellGenerator: TableCellGenerator {

    public var cellHeight: CGFloat {
        return height
    }

    public var estimatedCellHeight: CGFloat? {
        return height
    }

    public var identifier: UITableViewCell.Type {
        return UITableViewCell.self
    }

    public func registerCell(in tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.nameOfClass)
    }

}

// MARK: - ViewBuilder

extension EmptyHeightTableCellGenerator: ViewBuilder {

    public func build(view: UITableViewCell) {
        view.backgroundColor = .clear
        view.selectionStyle = .none
    }

}
