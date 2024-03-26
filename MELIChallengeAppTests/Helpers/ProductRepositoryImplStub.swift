//
//  ProductRepositoryImplStub.swift
//  MELIChallengeAppTests
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import Foundation

@testable import MELIChallengeApp

class ProductRepositoryImplStub: ProductRepository {
    
    let resultProductList: Result<[Product],ProductDomainError>
    let resultProductDetail: Result<ProductDetail,ProductDomainError>
    
    init(resultProductList: Result<[Product], ProductDomainError>, resultProductDetail: Result<ProductDetail, ProductDomainError>) {
        self.resultProductList = resultProductList
        self.resultProductDetail = resultProductDetail
    }
    
    func getProductList(_ title: String) async -> Result<[Product], ProductDomainError> {
        resultProductList
    }
    
    func getProduct(byId id: String) async -> Result<ProductDetail, ProductDomainError> {
        resultProductDetail
    }
    
}
