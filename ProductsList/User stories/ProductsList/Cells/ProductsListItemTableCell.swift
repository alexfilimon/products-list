//
//  ProductsListItemTableCell.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager
import SurfUtils

final class ProductsListItemTableCell: UITableViewCell, Configurable {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var checkMarkView: CheckMarkView!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        UIView.animate(withDuration: 0.1) {
            self.contentView.alpha = highlighted ? 0.5 : 1
        }
    }

    // MARK: - Configurable

    func configure(with model: ProductsListItemTableCellModel) {
        titleLabel.attributedText = StringBuilder(globalAttributes: [.font(UIFont.systemFont(ofSize: 17))])
            .add(text: model.title, with: [.foregroundColor(.label)])
            .addSpace()
            .addSpace()
            .add(text: model.quantity ?? "",
                 with: [.font(.systemFont(ofSize: 16)), .foregroundColor(.secondaryLabel)])
            .value
        checkMarkView.configure(isChecked: model.isChecked)
    }

}

// MARK: - Appearance

private extension ProductsListItemTableCell {

    func configureAppearance() {
        selectionStyle = .none
        contentView.backgroundColor = .tertiarySystemGroupedBackground
    }

}
