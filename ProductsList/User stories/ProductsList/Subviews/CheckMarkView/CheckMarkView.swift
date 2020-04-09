//
//  CheckMarkView.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

final class CheckMarkView: DesignableView {

    // MARK: - IBOutlets

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var checkImageView: UIImageView!

    // MARK: - Initializaion

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureAppearance()
    }

    // MARK: - Methods

    func configure(isChecked: Bool) {
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 4
        containerView.layer.borderColor = isChecked ? UIColor.systemGreen.cgColor : UIColor.secondaryLabel.cgColor
        containerView.layer.borderWidth = 2
        checkImageView.tintColor = .systemGreen

        let checkImage = UIImage(systemName: "checkmark",
                                 withConfiguration: UIImage.SymbolConfiguration(pointSize: 13, weight: .bold))
        checkImageView.image = isChecked ? checkImage : nil
        checkImageView.contentMode = .center
    }

}

// MARK: - Appearance

private extension CheckMarkView {

    func configureAppearance() {
        configureContainerView()
        configureImageView()
    }

    func configureContainerView() {

    }

    func configureImageView() {

    }

}
