//
//  ProductDTO.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

struct ProductDTO: Codable {
    let id: String
    let title: String
    let condition: String
    let thumbnail: String
    let price: Double
    let availableQuantity: Int
    let installments: Installments?
    
    private enum CodingKeys: String, CodingKey {
        case id, title, condition, thumbnail, price, installments
        case availableQuantity = "available_quantity"
    }
}

struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let currencyId: String
    
    private enum CodingKeys: String, CodingKey {
        case quantity, amount
        case currencyId = "currency_id"
    }
}


struct ResultsDTO: Codable {
    let results: [ProductDTO]
}
