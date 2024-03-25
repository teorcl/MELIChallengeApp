//
//  ProductDetail.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 25/03/24.
//

import Foundation

struct ProductDetail {
    let title: String
    let price: Int
    let currencyId: String
    let initialQuantity: Int
    let condition: String
    let pictures: [Picture]
    let status: String
    
    struct Picture {
        let url: String
        let secureUrl: String
    }

}

