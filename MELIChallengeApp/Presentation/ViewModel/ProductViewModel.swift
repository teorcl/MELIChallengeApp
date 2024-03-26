//
//  ProductViewModel.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    private let getProductsUseCase: GetProductListProtocol
    private let getProductDetailUseCase: GetProductDetailProtocol
    private let errorMapper: ProductPresentableErrorMapper
    @Published var productsPresentable: [ProductListPresentableItem] = []
    @Published var productDetailPresentable: ProductDetailPresentable?
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    init(
        getProductsUseCase: GetProductListProtocol,
        getProductDetailUseCase: GetProductDetailProtocol,
        errorMapper: ProductPresentableErrorMapper
    ){
        self.getProductsUseCase = getProductsUseCase
        self.getProductDetailUseCase = getProductDetailUseCase
        self.errorMapper = errorMapper
    }
    
    func search(product title: String){
        isLoading = true
        Task {
            let result = await getProductsUseCase.byTitle(title)
            guard case .success(let productsObtained) = result else {
                handleError(error: result.failureValue as? ProductDomainError)
                return
            }
        
            
            Task { @MainActor in
                productsPresentable = productsObtained.map({ productObtained in
                    return ProductListPresentableItem(domainModel: productObtained)
                })
                isLoading = false
            }
        }
        
    }
    
    func fetchProduct(id: String) {
        Task {
            let result = await self.getProductDetailUseCase.byId(id)
            guard case .success(let productDetailObtained) = result else {
                handleError(error: result.failureValue as? ProductDomainError)
                return
            }
        
            
            Task { @MainActor in
                isLoading = false
                productDetailPresentable = ProductDetailPresentable(domainModel: productDetailObtained)
            }
        }
    }
    
    func refreshProductList(){
        productsPresentable = []
    }
    
    private func handleError(error: ProductDomainError?) {
        let errorMessage = errorMapper.map(error: error)
        Task { @MainActor in
            isLoading = false
            self.errorMessage = errorMessage
        }
    }
}
