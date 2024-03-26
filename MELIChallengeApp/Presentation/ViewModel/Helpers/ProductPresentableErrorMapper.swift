//
//  ProductPresentableErrorMapper.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 25/03/24.
//

import Foundation

class ProductPresentableErrorMapper {
    func map(error: ProductDomainError?) -> String {
        guard error == .tooManyRequests else {
            return "Something went wrong"
        }
        
        return "You have exceeded the limit of requests. Try again later"
        
    }
}
