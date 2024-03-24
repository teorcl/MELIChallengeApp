//
//  GetProductList.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

protocol GetProductListProtocol {
    func byTitle(_ title: String) async -> Result<[Product], ProductDomainError>
}

class GetProductList: GetProductListProtocol {
    
    private let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func byTitle(_ title: String) async -> Result<[Product], ProductDomainError> {
        
        let result = await repository.getProductList(title)
        
        guard let productList = try? result.get() else {
            guard case .failure(let failure) = result else {
                return .failure(.generic)
            }
            
            return .failure(failure)
        }
        
        return .success(productList)
    }
}
