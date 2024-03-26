//
//  ProductDetailView.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    
    let product: ProductListPresentableItem
    @ObservedObject  var viewModel: ProductViewModel
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        ScrollView {
            VStack {
                Carousel(imageUrls: viewModel.productDetailPresentable!.pictures.map({ picture in
                    picture.secureUrl
                }))
                    .frame(height: screenHeight * 0.5)
                Text(viewModel.productDetailPresentable!.title)
                Text(viewModel.productDetailPresentable!.price)
                Text("Moneda: \(viewModel.productDetailPresentable!.currencyId)")
                Text("Cantidad: \(viewModel.productDetailPresentable!.initialQuantity)")
                Text("Condición: \(viewModel.productDetailPresentable!.condition)")
                Text("Estado: \(viewModel.productDetailPresentable!.status)")
                Spacer()
            }.navigationBarTitle(Text(product.title), displayMode: .inline)
                
        }.padding(10)
        
    }
}

