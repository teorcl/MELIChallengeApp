//
//  ProductViewModel.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import Foundation

struct ProductDetailPresentable {
    let title: String
    let price: String
    let currencyId: String
    let initialQuantity: String
    let condition: String
    let pictures: [Picture]
    let status: String
    
    struct Picture {
        let url: String
        let secureUrl: String
    }
    
    init(domainModel: ProductDetail) {
        self.title = domainModel.title
        self.price = "$ \(domainModel.price)"
        self.currencyId = domainModel.currencyId
        self.initialQuantity = "\(domainModel.initialQuantity)"
        self.condition = domainModel.condition
        self.status = domainModel.status
        self.pictures = domainModel.pictures.map({ picture in
            Picture(url: picture.url, secureUrl: picture.secureUrl)
        })
    }
}

// Esta vaina es para no mostrar directamente la entidad sino hacer la conversion a algo que sea mas pensado para el usuario
struct ProductListPresentableItem {
    let id: String
    let title: String
    let thumbnail: String
    let price: String
    
    init(domainModel: Product){
        self.id = domainModel.id
        self.title = domainModel.title
        self.thumbnail = ProductListPresentableItem.convertHTTPToHTTPS(urlString: domainModel.thumbnail) ?? "https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg"
        self.price = "$ \(domainModel.price)"
        
    }
    
    static func convertHTTPToHTTPS(urlString: String) -> String? {
        if var urlComponents = URLComponents(string: urlString) {
            urlComponents.scheme = "https"
            return urlComponents.string
        }
        return nil 
    }
    
}

class ProductViewModel: ObservableObject {
    //MARK: - Use case
    private let getProductsUseCase: GetProductListProtocol
    private let getProductDetailUseCase: GetProductDetailProtocol
    @Published var productsPresentable: [ProductListPresentableItem] = []
    @Published var productDetailPresentable: ProductDetailPresentable?
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    
    init(getProductsUseCase:GetProductListProtocol, getProductDetailUseCase: GetProductDetailProtocol){
        self.getProductsUseCase = getProductsUseCase
        self.getProductDetailUseCase = getProductDetailUseCase
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
                isLoading = false
                //Convierto la lista de Entity a Porductos representables
                productsPresentable = productsObtained.map({ productObtained in
                    return ProductListPresentableItem(domainModel: productObtained)
                })
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
                //Convierto la lista de Entity a Porductos representables
                productDetailPresentable = ProductDetailPresentable(domainModel: productDetailObtained)
            }
        }
    }
    
    private func handleError(error: ProductDomainError?) {
//        let errorMessage = errorMapper.map(error: error)
//        Task { @MainActor in
//            isLoading = false
//            self.errorMessage = errorMessage
//        }
    }
}
