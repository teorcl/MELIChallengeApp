//
//  VistaDePrueba.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import SwiftUI

struct VistaDePrueba: View {
    
    @ObservedObject private var viewModel: ProductViewModel
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.productsPresentable, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(product: product)){
                    RowView(product: product)
                }
                //Text(product.title)
            }.navigationBarTitle("Productos")
        }.onAppear{
            viewModel.onAppear()
        }
    }
}

//#Preview {
//    VistaDePrueba()
//}
