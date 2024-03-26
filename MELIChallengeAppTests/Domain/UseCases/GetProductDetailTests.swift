//
//  GetProductDetailTests.swift
//  MELIChallengeAppTests
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import XCTest
@testable import MELIChallengeApp

final class GetProductDetailTests: XCTestCase {
    func test_execute_returns_succesfully_product_detail_when_repository_returns_pproduct_detail() async throws {
        
        //GIVEN
        let productListMock = [
            Product(id: "1", title: "Casa", thumbnail: "thumbnail1", price: 30000000),
            Product(id: "2", title: "Product 2", thumbnail: "thumbnail2", price: 90.0)
        ]
        
        let productDetailMock = ProductDetail(title: "Casa", price: 30000000, currencyId: "COP", initialQuantity: 1, condition: "used", pictures: [ProductDetail.Picture(url: "1", secureUrl: "2")], status: "disponible")
        
        let resultProducts: Result<[Product], ProductDomainError> = .success(productListMock)
        let resultProductDetail: Result<ProductDetail, ProductDomainError> = .success(productDetailMock)
        
        let stub = ProductRepositoryImplStub(resultProductList: resultProducts, resultProductDetail: resultProductDetail)
        let sut = GetProductDetail(repository: stub)
        
        // WHEN
        let capturedResult = await sut.byId("1")
        
        let productDetailObtained = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(productDetailObtained, productDetailMock)
        
    }
    
    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let resultProducts: Result<[Product], ProductDomainError> = .failure(.generic)
        let resultProductDetail: Result<ProductDetail, ProductDomainError> = .failure(.generic)
        let stub = ProductRepositoryImplStub(resultProductList: resultProducts, resultProductDetail: resultProductDetail)
        let sut = GetProductDetail(repository: stub)
        
        // WHEN
        let capturedResult = await sut.byId("5")
        
        // THEN
        XCTAssertEqual(capturedResult, resultProductDetail)
    }

}
