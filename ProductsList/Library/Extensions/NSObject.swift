//
//  NSObject.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

public extension NSObject {

    @objc class var className: String {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

    @objc var className: String {
        if let name = NSStringFromClass(type(of: self)).components(separatedBy: ".").last {
            return name
        }
        return ""
    }

}
