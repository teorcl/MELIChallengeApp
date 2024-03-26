//
//  GetProductListTests.swift
//  MELIChallengeAppTests
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import XCTest
@testable import MELIChallengeApp

final class GetProductListTests: XCTestCase {

    func test_execute_sucesfully_returns_array_when_repository_returns_nonEmpty_array() async throws {
        
        //GIVEN
        let productListMock = [
            Product(id: "1", title: "Product 1", thumbnail: "thumbnail1", price: 10.0),
            Product(id: "2", title: "Product 2", thumbnail: "thumbnail2", price: 90.0)
        ]
        
        let productDetailMock = ProductDetail(title: "Casa", price: 30000000, currencyId: "COP", initialQuantity: 1, condition: "used", pictures: [ProductDetail.Picture(url: "1", secureUrl: "2")], status: "disponible")
        
        let resultProducts: Result<[Product], ProductDomainError> = .success(productListMock)
        let resultProductDetail: Result<ProductDetail, ProductDomainError> = .success(productDetailMock)
        
        let stub = ProductRepositoryImplStub(resultProductList: resultProducts, resultProductDetail: resultProductDetail)
        let sut = GetProductList(repository: stub)
        
        //WHEN
        let capturedResult = await sut.byTitle("Product")
        
        //THEN
        let capturedProductList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedProductList,productListMock)
        
    }
    
    func test_execute_sucesfully_returns_array_empty_when_repository_returns_empty_array_because_product_no_found() async throws {
        
        //GIVEN
        let productListMock: [Product] = []
        
        let productDetailMock = ProductDetail(title: "Casa", price: 30000000, currencyId: "COP", initialQuantity: 1, condition: "used", pictures: [ProductDetail.Picture(url: "1", secureUrl: "2")], status: "disponible")
        
        let resultProducts: Result<[Product], ProductDomainError> = .success(productListMock)
        let resultProductDetail: Result<ProductDetail, ProductDomainError> = .success(productDetailMock)
        
        let stub = ProductRepositoryImplStub(resultProductList: resultProducts, resultProductDetail: resultProductDetail)
        let sut = GetProductList(repository: stub)
        
        //WHEN
        let capturedResult = await sut.byTitle("Product")
        
        //THEN
        let capturedProductList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedProductList,productListMock)
        
    }
    
    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let resultProducts: Result<[Product], ProductDomainError> = .failure(.generic)
        let resultProductDetail: Result<ProductDetail, ProductDomainError> = .failure(.generic)
        let stub = ProductRepositoryImplStub(resultProductList: resultProducts, resultProductDetail: resultProductDetail)
        let sut = GetProductList(repository: stub)
        
        // WHEN
        let capturedResult = await sut.byTitle("Product")
        
        // THEN
        XCTAssertEqual(capturedResult, resultProducts)
    }

}
