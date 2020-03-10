//
//  Closures.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

typealias EmptyClosure = () -> Void
typealias Closure<T> = (T) -> Void
typealias ReturnClosure<T, R> = (T) -> R
