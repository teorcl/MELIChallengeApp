//
//  ContentView.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import SwiftUI

struct ContentView: View {
    
    let products = Produc.fetchProducts()
    
    var body: some View {
        NavigationView {
            List(self.products, id: \.title) { product in
                NavigationLink(destination: ProductDetailView(product: product)){
                    RowView(product: product)
                }
            }.navigationBarTitle("Productos")
        }
    }
}

#Preview {
    ContentView()
}
