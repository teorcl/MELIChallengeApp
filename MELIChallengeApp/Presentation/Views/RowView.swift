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
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            } placeholder: {
                KFImage(URL(string: "https://i.gifer.com/ZKZg.gif")
                ).resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                
            }
                
            
            VStack(alignment: .leading, content: {
                Text(product.title)
                Text(product.price)
            })
            
            Spacer()
        }.background(colorScheme == .dark ? Color.black : Color.white)
    }
}

