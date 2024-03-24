//
//  RowView.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import SwiftUI
import Kingfisher

struct RowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let product: ProductListPresentableItem
    
    var body: some View {
        HStack {
            //KFImage(URL(string: product.thumbnail))
//            KFImage(URL(string: product.thumbnail))
//                .placeholder{
//                    ProgressView()
//                        .progressViewStyle(CircularProgressViewStyle(tint: Color("ColorAccent")))
//                }
//                .resizable()
//                .frame(width: 120, height: 120)
//                .cornerRadius(10)
            
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("ColorAccent")))
            }
                
            
            VStack(alignment: .leading, content: {
                Text(product.title)
                Text(String(format: "$ %.1f", product.price))
            })
            
            Spacer()
        }.background(colorScheme == .dark ? Color.black : Color.white)
    }
}

