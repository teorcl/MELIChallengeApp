//
//  ProductDetailViewModel.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import Foundation
 
class ProductDetailViewModel: ObservableObject {
    
    private let getProductDetailUseCase: GetProductDetailProtocol
    private let errorMapper: ProductPresentableErrorMapper
    @Published var errorMessage: String?
    @Published var productDetailPresentable: ProductDetailPresentable?
    
    init(
        getProductDetailUseCase: GetProductDetailProtocol,
        errorMapper: ProductPresentableErrorMapper)
    {
        self.getProductDetailUseCase = getProductDetailUseCase
        self.errorMapper = errorMapper
    }
    
    func fetchProduct(id: String) {
        Task {
            let result = await self.getProductDetailUseCase.byId(id)
            guard case .success(let productDetailObtained) = result else {
                handleError(error: result.failureValue as? ProductDomainError)
                return
            }
        
            
            Task { @MainActor in
                //isLoading = false
                productDetailPresentable = ProductDetailPresentable(domainModel: productDetailObtained)
            }
        }
    }
    
    private func handleError(error: ProductDomainError?) {
        let errorMessage = errorMapper.map(error: error)
        Task { @MainActor in
            //isLoading = false
            self.errorMessage = errorMessage
        }
    }
}
