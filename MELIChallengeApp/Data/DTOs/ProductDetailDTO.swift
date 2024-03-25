//
//  ProductDetailDTO.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 25/03/24.
//

import Foundation

struct ProductDetailDTO: Codable {
    let title: String
    let price: Int
    let currencyId: String
    let initialQuantity: Int
    let condition: String
    let pictures: [Picture]
    let status: String

    enum CodingKeys: String, CodingKey {
        case title, price, condition, pictures, status
        case currencyId = "currency_id"
        case initialQuantity = "initial_quantity"
    }
    
    struct Picture: Codable {
        let url: String
        let secureUrl: String

        enum CodingKeys: String, CodingKey {
            case url
            case secureUrl = "secure_url"
        }
    }
}

