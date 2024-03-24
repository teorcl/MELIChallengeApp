//
//  ProductRemoteDataSource.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

protocol ProductRemoteDataSource {
    func getProductList(byTitle title: String) async -> Result<ResultsDTO, HTTPClientError>
    //func getProductPictures( proudctId: String) async -> Result<[PictureDTO], HTTPClientError>
}

class ProductRemoteDataSourceImpl: ProductRemoteDataSource {
    
    private let httpClient: HTTPClientInfra
    
    init(httpClient: HTTPClientInfra) {
        self.httpClient = httpClient
    }
    
    func getProductList(byTitle title: String) async -> Result<ResultsDTO, HTTPClientError> {
        let endpoint = Endpoint(
            path: "sites/MCO/search",
            queryParamters: [
                "q" : title
            ],
            method: .get
        )
        
        let result = await httpClient.makeRequest(urlBase: MLApi.baseURL.rawValue, endpoint: endpoint)
        
        guard case .success(let data) = result else {
            let error = result.failureValue as? HTTPClientError
            return .failure(handleError(error: error))
        }

        
        guard let productResults = try? JSONDecoder().decode(ResultsDTO.self, from: data) else {
            return .failure(.parsingError)
        }

        return .success(productResults)
    }
    
    /*func getProductPictures(proudctId: String) async -> Result<[PictureDTO], HTTPClientError> {
        <#code#>
    }*/
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else { return .generic }
        return error
    }
    
}
