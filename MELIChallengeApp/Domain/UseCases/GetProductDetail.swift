//
//  GetProductDetail.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 25/03/24.
//

import Foundation

protocol GetProductDetailProtocol {
    func byId(_ id: String) async -> Result<ProductDetail, ProductDomainError>
}

class GetProductDetail: GetProductDetailProtocol {
    
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func byId(_ id: String) async -> Result<ProductDetail, ProductDomainError> {
        let result = await repository.getProduct(byId: id)
        guard let productDetail = try? result.get() else {
            guard case .failure(let failure) = result else {
                return .failure(.generic)
            }
            
            return .failure(failure)
        }
        
        return .success(productDetail)
    }
}
