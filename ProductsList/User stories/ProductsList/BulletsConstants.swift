//
//  BulletsConstants.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 09/04/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import BLTNBoard

enum BulletsConstants {
    static let appearance: BLTNItemAppearance = {
        let appearance = BLTNItemAppearance()
        appearance.actionButtonColor = .systemGreen
        appearance.descriptionFontSize = 18
        return appearance
    }()
    static var backgroundStyle: BLTNBackgroundViewStyle {
        return UIApplication.isDarkTheme
            ? .blurredLight
            : .blurredDark
    }
}
