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
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        ScrollView {
            VStack {
                KFImage(URL(string: product.thumbnail))
                    .placeholder{
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(
                                tint: Color.yellow
                                )
                            )
                    }
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: screenHeight * 0.5)
//                Carousel(imageUrls: product.images)
//                    .frame(height: screenHeight * 0.5)
                Text(product.title)
                Text(String(format: "$ %.1f", product.price))
                Spacer()
            }.navigationBarTitle(Text(product.title), displayMode: .inline)
        }
        
    }
}

