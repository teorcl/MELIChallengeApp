//
//  ProductRepositoryImplTests.swift
//  MELIChallengeAppTests
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import XCTest
@testable import MELIChallengeApp

final class ProductRepositoryImplTests: XCTestCase {
    
    func test_getProductList_Success_with_data() async throws{
        
        let productListMock = [
            Product(id: "1", title: "Product 1", thumbnail: "thumbnail1", price: 10.0),
            Product(id: "2", title: "Product 2", thumbnail: "thumbnail2", price: 90.0)
        ]
        
        let productListDTOMock = [
            ProductDTO(id: "1", title: "Product 1", thumbnail: "thumbnail1", price: 10.0),
            ProductDTO(id: "2", title: "Product 2", thumbnail: "thumbnail2", price: 90.0)
        ]
        
        let resultsDTOMock = ResultsDTO(results: productListDTOMock)
        
        let productDetailDTOMock = ProductDetailDTO(title: "Casa", price: 30000000, currencyId: "COP", initialQuantity: 1, condition: "used", pictures: [ProductDetailDTO.Picture(url: "1", secureUrl: "2")], status: "disponible")
        
        let resultProducts: Result<ResultsDTO, HTTPClientError> = .success(resultsDTOMock)
        let resultProductDetail: Result<ProductDetailDTO, HTTPClientError> = .success(productDetailDTOMock)
        
        //GIVEN
        let stub = ProductRemoteDataSourceImplStub(resultProductList: resultProducts, resultProduct: resultProductDetail)
        let sut = ProductRepositoryImpl(
            dataSource: stub,
            errorMapper: ProductDomainErrorMapper(),
            productDomainMapper: ProductDomainMapper()
        )
        
        // WHEN
        let resultObtained = await sut.getProductList("product")
        
        //THEN
        let productList = try XCTUnwrap(resultObtained.get())
        XCTAssertEqual(productList, productListMock)
    }
    
    func test_getProductList_Success_with_out_data() async throws {
        let productListMock:[Product] = []
        
        let productListDTOMock:[ProductDTO] = []
        
        let resultsDTOMock = ResultsDTO(results: productListDTOMock)
        
        let productDetailDTOMock = ProductDetailDTO(title: "Casa", price: 30000000, currencyId: "COP", initialQuantity: 1, condition: "used", pictures: [ProductDetailDTO.Picture(url: "1", secureUrl: "2")], status: "disponible")
        
        let resultProducts: Result<ResultsDTO, HTTPClientError> = .success(resultsDTOMock)
        let resultProductDetail: Result<ProductDetailDTO, HTTPClientError> = .success(productDetailDTOMock)
        
        //GIVEN
        let stub = ProductRemoteDataSourceImplStub(resultProductList: resultProducts, resultProduct: resultProductDetail)
        let sut = ProductRepositoryImpl(
            dataSource: stub,
            errorMapper: ProductDomainErrorMapper(),
            productDomainMapper: ProductDomainMapper()
        )
        
        // WHEN
        let resultObtained = await sut.getProductList("product")
        
        //THEN
        let productList = try XCTUnwrap(resultObtained.get())
        XCTAssertEqual(productList, productListMock)
    }
    
    func test_getProductList_return_failure_when_remote_data_source_failure() async throws {
        let resultProducts: Result<ResultsDTO, HTTPClientError> = .failure(.clientError)
        
        let resultProductDetail: Result<ProductDetailDTO, HTTPClientError> = .failure(.clientError)
        
        let stub = ProductRemoteDataSourceImplStub(resultProductList: resultProducts, resultProduct: resultProductDetail)
        
        let sut = ProductRepositoryImpl(
            dataSource: stub,
            errorMapper: ProductDomainErrorMapper(),
            productDomainMapper: ProductDomainMapper()
        )
        
        //WHEN
        let capturedResult = await sut.getProductList("Product")
        guard case .failure(let failure) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        
        // THEN
        XCTAssertEqual(failure, ProductDomainError.generic)
    }
    
    func test_getProduct_success_when_remote_data_source_return_success() async throws {
        
        let productDetailMock = ProductDetail(title: "Casa", price: 30000000, currencyId: "COP", initialQuantity: 1, condition: "used", pictures: [ProductDetail.Picture(url: "1", secureUrl: "2")], status: "disponible")
        

        let productListDTOMock = [
            ProductDTO(id: "1", title: "Product 1", thumbnail: "thumbnail1", price: 10.0),
            ProductDTO(id: "2", title: "Product 2", thumbnail: "thumbnail2", price: 90.0)
        ]
        
        let resultsDTOMock = ResultsDTO(results: productListDTOMock)
        
        let productDetailDTOMock = ProductDetailDTO(title: "Casa", price: 30000000, currencyId: "COP", initialQuantity: 1, condition: "used", pictures: [ProductDetailDTO.Picture(url: "1", secureUrl: "2")], status: "disponible")
        
        let resultProducts: Result<ResultsDTO, HTTPClientError> = .success(resultsDTOMock)
        let resultProductDetail: Result<ProductDetailDTO, HTTPClientError> = .success(productDetailDTOMock)
        
        //GIVEN
        let stub = ProductRemoteDataSourceImplStub(resultProductList: resultProducts, resultProduct: resultProductDetail)
        let sut = ProductRepositoryImpl(
            dataSource: stub,
            errorMapper: ProductDomainErrorMapper(),
            productDomainMapper: ProductDomainMapper()
        )
        
        // WHEN
        let resultObtained = await sut.getProduct(byId: "id")
        
        //THEN
        let productDetail = try XCTUnwrap(resultObtained.get())
        XCTAssertEqual(productDetail, productDetailMock)
        
    }
    
    func test_getProduct_return_failure_when_remote_data_source_failure() async {
        let resultProducts: Result<ResultsDTO, HTTPClientError> = .failure(.clientError)
        
        let resultProductDetail: Result<ProductDetailDTO, HTTPClientError> = .failure(.clientError)
        
        let stub = ProductRemoteDataSourceImplStub(resultProductList: resultProducts, resultProduct: resultProductDetail)
        
        let sut = ProductRepositoryImpl(
            dataSource: stub,
            errorMapper: ProductDomainErrorMapper(),
            productDomainMapper: ProductDomainMapper()
        )
        
        //WHEN
        let capturedResult = await sut.getProduct(byId: "id")
        guard case .failure(let failure) = capturedResult else {
            XCTFail("Expected failure, got success")
            return
        }

        // THEN
        XCTAssertEqual(failure, ProductDomainError.generic)
    }
}
