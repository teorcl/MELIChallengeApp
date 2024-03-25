//
//  ProductListFactory.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import Foundation
class ProductListFactory {
    
    static func createSearchView() -> SearchView {
        return SearchView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> ProductViewModel {
        return ProductViewModel(getProductsUseCase: createUseCase())
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
