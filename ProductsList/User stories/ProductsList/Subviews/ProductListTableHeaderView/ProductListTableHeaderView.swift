//
//  ProductListTableHeaderView.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

final class ProductListTableHeaderView: DesignableView {

    // MARK: - IBOutlets

    @IBOutlet private weak var titleButton: UIButton!

    // MARK: - Properties

    var onAction: EmptyClosure?

    // MARK: - Private Properties

    private let image = UIImage(systemName: "chevron.right",
                                withConfiguration: UIImage.SymbolConfiguration(weight: .bold))

    // MARK: - Initializaion

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAppearance()
    }

    // MARK: - UIView

    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = image?.size.width ?? 0
        let padding: CGFloat = 5
        let imageWidthWithPadding = padding + imageWidth

        titleButton.contentEdgeInsets = .init(top: 0, left: padding, bottom: 0, right: 0)
        titleButton.imageEdgeInsets = .init(top: 0,
                                            left: titleButton.frame.width - imageWidthWithPadding,
                                            bottom: 0,
                                            right: 0)
        titleButton.titleEdgeInsets = .init(top: 0,
                                            left: -imageWidthWithPadding,
                                            bottom: 0,
                                            right: imageWidthWithPadding)
    }

    // MARK: - Configuration Methods

    func configure(title: String) {
        UIView.performWithoutAnimation {
            self.titleButton.setTitle(title, for: .normal)
            self.titleButton.layoutIfNeeded()
        }
    }

}

// MARK: - Actions

extension ProductListTableHeaderView {

    @IBAction private func buttonPressed(_ sender: Any) {
        onAction?()
    }

}

// MARK: - Appearance

private extension ProductListTableHeaderView {

    func configureAppearance() {
        configureTitleButton()
    }

    func configureTitleButton() {
        titleButton.tintColor = .label
        titleButton.setImage(image, for: .normal)
        titleButton.contentHorizontalAlignment = .leading
        titleButton.titleLabel?.numberOfLines = 1
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }

}
