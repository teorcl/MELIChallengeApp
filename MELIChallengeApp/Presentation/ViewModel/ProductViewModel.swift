//
//  ProductViewModel.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import Foundation

// Esta vaina es para no mostrar directamente la entidad sino hacer la conversion a algo que sea mas pensado para el usuario
struct ProductListPresentableItem {
    let id: String
    let title: String
    let condition: String
    let thumbnail: String // Imagen miniatura para
    let price: String
    let availableQuantity: String
    let installments: Installments //Coutas
    let pictures: [Picture]
    
    struct Picture {
        let url: String
        let size: String
    }
    
    struct Installments {
        let quantity: String
        let amount: String
        let currencyId: String
        
    }
    
    init(domainModel: Product){
        self.id = domainModel.id
        self.title = domainModel.title
        self.condition = domainModel.condition
        self.thumbnail = ProductListPresentableItem.convertHTTPToHTTPS(urlString: domainModel.thumbnail) ?? "https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg"
        self.price = "$ \(domainModel.price)"
        self.availableQuantity =  "\(domainModel.availableQuantity)"
        self.installments = Installments(
            quantity: "\(domainModel.installments.quantity)",
            amount: "\(domainModel.installments.amount)",
            currencyId: domainModel.installments.currencyId
        )
        self.pictures = domainModel.pictures.map({ item in
            Picture(url: item.url, size: item.size)
        }
        )
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
    @Published var productsPresentable: [ProductListPresentableItem] = []
    @Published var showAlert: Bool = false
    @Published var isLoading: Bool = false
    
    init(getProductsUseCase:GetProductListProtocol){
        self.getProductsUseCase = getProductsUseCase
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
    
    private func handleError(error: ProductDomainError?) {
//        let errorMessage = errorMapper.map(error: error)
//        Task { @MainActor in
//            isLoading = false
//            self.errorMessage = errorMessage
//        }
    }
}
