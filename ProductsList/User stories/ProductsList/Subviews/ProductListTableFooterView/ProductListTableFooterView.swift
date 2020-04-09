//
//  ProductListTableFooterView.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

final class ProductListTableFooterView: DesignableView {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Initializaion

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
    }

    // MARK: - Configuration Methods

    func configure(text: String) {
        titleLabel.text = text
    }

}

// MARK: - Appearance

private extension ProductListTableFooterView {

    func configureAppearance() {
        configureTitleLabel()
    }

    func configureTitleLabel() {
        titleLabel.textColor = .secondaryLabel
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .right
    }

}
