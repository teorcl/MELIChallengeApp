//
//  ProductDomainErrorMapper.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

class ProductDomainErrorMapper {
    func map(error: HTTPClientError?) -> ProductDomainError {
        return .generic
    }
}
