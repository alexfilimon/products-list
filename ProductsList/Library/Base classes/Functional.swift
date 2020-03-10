//
//  Functional.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

// MARK: - Weak Methods

public func weak<O: AnyObject>(_ object: O,
                               _ method: @escaping (O) -> Void) -> () -> Void {
    return { [weak object] in
        if let object = object {
            method(object)
        }
    }
}

public func weak<O: AnyObject, T: Any>(_ object: O,
                                       _ method: @escaping (O, T) -> Void) -> (T) -> Void {
    return { [weak object] t in
        if let object = object {
            method(object, t)
        }
    }
}

infix operator <-
public func <-<A: Any, B: Any>(left: inout A?, right: (B?, (B) -> A)) {
    guard let object = right.0 else {
        left = nil
        return
    }
    left = right.1(object)
}
