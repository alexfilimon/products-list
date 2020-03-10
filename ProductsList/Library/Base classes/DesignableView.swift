//
//  DesignableView.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

/// Inherit custom subview from this class instead of UIView,
///     mark it as @IBDesignable,
///     set the file's owner and do not set the View's class,
///     =>
///     It renders in the IB!
open class DesignableView: UIView {

    // MARK: - Public Properties

    public var view: UIView? {
        return subviews.first
    }

    // MARK: - Initialization

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _ = setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        _ = setup()
    }

    // MARK: - Private Properties

    private func setup() -> UIView? {
        let view = Bundle(for: type(of: self)).loadNibNamed(self.className, owner: self, options: nil)?.first as? UIView
        if let v = view {
            addSubview(v)
            v.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                v.topAnchor.constraint(equalTo: topAnchor),
                v.bottomAnchor.constraint(equalTo: bottomAnchor),
                v.leadingAnchor.constraint(equalTo: leadingAnchor),
                v.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
        return view
    }

}

