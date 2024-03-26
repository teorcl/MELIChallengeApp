//
//  ProductRemoteDataSourceImplStub.swift
//  MELIChallengeAppTests
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import Foundation
@testable import MELIChallengeApp

class ProductRemoteDataSourceImplStub: ProductRemoteDataSource {
    
    let resultProductList: Result<ResultsDTO, HTTPClientError>
    let resultProduct: Result<ProductDetailDTO, HTTPClientError>
    
    init(resultProductList: Result<ResultsDTO, HTTPClientError>, resultProduct: Result<ProductDetailDTO, HTTPClientError>) {
        self.resultProductList = resultProductList
        self.resultProduct = resultProduct
    }
    
    func getProductList(byTitle title: String) async -> Result<ResultsDTO,HTTPClientError> {
        return resultProductList
    }
    
    func getProduct(proudctId: String) async -> Result<ProductDetailDTO, HTTPClientError> {
        return resultProduct
    }
    
}
