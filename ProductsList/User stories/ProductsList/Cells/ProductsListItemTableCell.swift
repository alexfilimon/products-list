//
//  ProductsListItemTableCell.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class ProductsListItemTableCell: UITableViewCell, Configurable {

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    // MARK: - Configurable

    func configure(with model: ProductsListItemTableCellModel) {
        textLabel?.text = model.title
    }
    
}

// MARK: - Appearance

private extension ProductsListItemTableCell {

    func configureAppearance() {
        selectionStyle = .none
    }

}
