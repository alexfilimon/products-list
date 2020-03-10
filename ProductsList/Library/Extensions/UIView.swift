//
//  UIView.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import UIKit

extension UIView {

    /// Loads view from nib and sets to the view as a subview
    ///
    /// May be used for initializing views that have layout in xibs
    ///
    /// Example:
    /// ```
    /// init() {
    ///     super.init(frame: CGRect.zero)
    ///     initFromNib()
    /// }
    ///
    /// required init?(coder aDecoder: NSCoder) {
    ///     super.init(coder: aDecoder)
    ///     initFromNib()
    /// }
    /// ```
    @discardableResult
    func initFromNib<T: UIView>() -> T? {
        guard let contentView: T = loadFromNib() else {
            return nil
        }
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = backgroundColor

        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                contentView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
                contentView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: self.topAnchor),
                contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                ])
        }
        return contentView
    }

    /// Instantiates view from a nib file
    func loadFromNib<T: UIView>() -> T? {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)

        let view = nib.instantiate(withOwner: self, options: nil).first as? T
        return view
    }

}
