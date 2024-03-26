//
//  ProductDetailPresentable.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 25/03/24.
//

import Foundation

struct ProductDetailPresentable {
    let title: String
    let price: String
    let currencyId: String
    let initialQuantity: String
    let condition: String
    let pictures: [Picture]
    let status: String
    
    struct Picture {
        let url: String
        let secureUrl: String
    }
    
    init(domainModel: ProductDetail) {
        self.title = domainModel.title
        self.price = "$ \(domainModel.price)"
        self.currencyId = domainModel.currencyId
        self.initialQuantity = "\(domainModel.initialQuantity)"
        self.condition = domainModel.condition
        self.status = domainModel.status
        self.pictures = domainModel.pictures.map({ picture in
            Picture(url: picture.url, secureUrl: picture.secureUrl)
        })
    }
}
