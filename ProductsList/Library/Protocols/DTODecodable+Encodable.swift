//
//  DTODecodable+Encodable.swift
//  ProductsList
//
//  Created by Alexander Filimonov on 10/03/2020.
//  Copyright © 2020 Alexander Filimonov. All rights reserved.
//

import Foundation

protocol DTODecodable {

    associatedtype DTO

    static func from(dto: DTO) throws -> Self

}

protocol DTOEncodable {

    associatedtype DTO

    func toDTO() throws -> DTO

}

protocol DTOConvertible: DTODecodable & DTOEncodable {}

extension DTODecodable {

    static func from(dto: DTO?) throws -> Self? {
        guard let dto = dto else {
            return nil
        }
        return try from(dto: dto)
    }

}
