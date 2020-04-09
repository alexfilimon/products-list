//
//  Functional.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

// MARK: - Weak Methods

import UIKit

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

public func weak<O1: AnyObject, O2: AnyObject, T: Any>(_ object1: O1,
                                                       _ object2: O2,
                                                       _ method: @escaping (O1, O2, T) -> Void) -> (T) -> Void {
    return { [weak object1, weak object2] t in
        if
            let object1 = object1,
            let object2 = object2
        {
            method(object1, object2, t)
        }
    }
}

public func weak<O1: AnyObject, O2: AnyObject, O3: AnyObject, T: Any>(
    _ object1: O1,
    _ object2: O2,
    _ object3: O3,
    _ method: @escaping (O1, O2, O3, T) -> Void
) -> (T) -> Void {
    return { [weak object1, weak object2, weak object3] t in
        if
            let object1 = object1,
            let object2 = object2,
            let object3 = object3
        {
            method(object1, object2, object3, t)
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

infix operator ~>
public func ~><A: Any>(left: A?, right: ((A) -> Void)?) {
    guard let left = left else { return }
    right?(left)
}
@discardableResult
public func ~><A: Any, B: Any>(left: A?, right: (A) -> B?) -> B? {
    guard let left = left else { return nil }
    return right(left)
}
@discardableResult
public func ~><A: Any, B: Any>(left: A?, right: (A) -> B) -> B? {
    guard let left = left else { return nil }
    return right(left)
}

infix operator ~~> : AssignmentPrecedence
func ~~><T: Any>(left: T, right: (T) -> Void) -> T {
  right(left)
  return left
}
