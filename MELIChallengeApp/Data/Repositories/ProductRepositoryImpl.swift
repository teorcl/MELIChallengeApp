//
//  ProductRepositoryImpl.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

class ProductRepositoryImpl: ProductRepository {
    
    private let dataSource: ProductRemoteDataSource
    private let errorMapper: ProductDomainErrorMapper
    private let productDomainMapper: ProductDomainMapper
    
    init(
        dataSource: ProductRemoteDataSource,
        errorMapper: ProductDomainErrorMapper,
        productDomainMapper: ProductDomainMapper
    ) {
        self.dataSource = dataSource
        self.errorMapper = errorMapper
        self.productDomainMapper = productDomainMapper
    }
    
    func getProductList(_ title: String) async -> Result<[Product], ProductDomainError> {
        let baseProducListResult = await dataSource.getProductList(byTitle: title)
        
        guard let baseProducList = try? baseProducListResult.get() else {
            guard case .failure(let failure) = baseProducListResult else {
                return .failure(.generic)
            }
            
            return .failure(errorMapper.map(error: failure))

        }
        
        baseProducList.results.forEach { pDTO in
            print(pDTO.thumbnail)
        }
        
        return .success(productDomainMapper.map(data: baseProducList))
    }
}
