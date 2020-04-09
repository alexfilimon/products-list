//
//  BLTNPageInput.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 28/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import BLTNBoard

final class BLTNPageInput: BLTNPageItem {

    // MARK: - Properties

    var titleInputValue: String?

    // MARK: - Private Properties

    private let placeholder: String
    private let desk: String?

    // MARK: - Initializaion

    init(title: String, description: String?, placeholder: String) {
        self.placeholder = placeholder
        self.desk = description
        super.init(title: title)
    }

    // MARK: - BLTNPageItem

    override func makeViewsUnderTitle(with interfaceBuilder: BLTNInterfaceBuilder) -> [UIView]? {
        let descLabel = interfaceBuilder.makeDescriptionLabel()
        descLabel.text = desk
        let titleTextField = interfaceBuilder.makeTextField(placeholder: placeholder,
                                                            returnKey: .done,
                                                            delegate: nil)
        titleTextField.addTarget(self,
                                 action: #selector(handleChangingTitle(_:)),
                                 for: .editingChanged)
        return [desk == nil ? nil : descLabel, titleTextField].compactMap { $0 }
    }

}

// MARK: - Private Properties

private extension BLTNPageInput {

    @objc
    func handleChangingTitle(_ sender: UITextField) {
        titleInputValue = sender.text
    }

}
