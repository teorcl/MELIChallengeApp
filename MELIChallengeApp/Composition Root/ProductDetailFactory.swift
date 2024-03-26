//
//  ProductDetailFactory.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import Foundation

class ProductDetailFactory {
    
    static func createViewModel() -> ProductDetailViewModel {
        return ProductDetailViewModel(
            getProductDetailUseCase: createGetProductDetailUseCase(),
            errorMapper: ProductPresentableErrorMapper()
        )
    }
    
    private static func createGetProductDetailUseCase() -> GetProductDetailProtocol {
        return GetProductDetail(repository: createRepository())
    }
    
    private static func createUseCase() -> GetProductListProtocol {
        return GetProductList(repository: createRepository())
    }
    
    private static func createRepository() -> ProductRepository {
        return ProductRepositoryImpl(
            dataSource: createRemoteDataSource(),
            errorMapper: ProductDomainErrorMapper(),
            productDomainMapper: ProductDomainMapper())
    }
    
    private static func createRemoteDataSource() -> ProductRemoteDataSource{
        return ProductRemoteDataSourceImpl(httpClient: createHTTPClient())
    }
    
    private static func createHTTPClient() -> HTTPClientInfra {
        return URLSessionHTTPClient(
            requestMaker: URLSessionRequestMaker(),
            errorResolver: URLSessionErrorResolver()
            
        )
    }
    
}
