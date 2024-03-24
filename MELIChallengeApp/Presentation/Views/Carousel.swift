//
//  Carousel.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import Foundation

import SwiftUI
import Kingfisher

struct Carousel: View {
    let imageUrls: [String]
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(imageUrls, id: \.self) { imageUrl in
                    VStack {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                width: geometry.size.width * 0.9,
                                height: geometry.size.height * 0.7
                            )
                            .cornerRadius(20) 
                    }
                    .padding(4)
                }
            }
            .tint(Color.black)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}



