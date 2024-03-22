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
    
    let product: Produc
    
    var body: some View {
        HStack {
            KFImage(URL(string: product.imageUrl))
                .resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            
            VStack(alignment: .leading, content: {
                Text(product.title)
                Text(String(format: "%.1f$", product.price))
            })
            
            Spacer()
        }.background(colorScheme == .dark ? Color.black : Color.white)
    }
}

