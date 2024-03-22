//
//  ProductDetailView.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    let product: Produc
    
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack {
            KFImage(URL(string: product.imageUrl))
                .resizable().aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Text(product.title)
            Text(String(format: "%.1f$", product.price))
        }.navigationBarTitle(Text(product.title), displayMode: .inline)
    }
}

