//
//  ProductBuilder.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

class ProductBuilder {
    
    let id: String
    let title: String
    let thumbnail: String
    let price: Double
    
    init(
        id: String,
        title: String,
        thumbnail: String,
        price: Double
    ) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.price = price
    }
    
    func build() -> Product? {
        return Product(
            id: id,
            title: title,
            thumbnail: thumbnail,
            price: price
        )
    }
}
