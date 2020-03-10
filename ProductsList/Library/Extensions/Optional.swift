//
//  Optional.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

extension Optional {
    func or(_ value: Wrapped) -> Wrapped {
        switch self {
        case .some(let currentValue):
            return currentValue
        case .none:
            return value
        }
    }
}
