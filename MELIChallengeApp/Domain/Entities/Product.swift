//
//  Product.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 22/03/24.
//

import Foundation

// MARK: - Product
struct Product {
    let id: String
    let title: String
    let condition: String
    let thumbnail: String // Imagen miniatura para
    let price: Double
    let availableQuantity: Int
    let installments: Installments //Coutas
    let pictures: [Picture]
}

// MARK: - Installments (Para pintar coutas y precio de cuotas)
/*struct Installments {
    let quantity: Int
    let amount: Double
    let currencyID: String
}*/

// MARK: - Picture
struct Picture {
    let url: String
    let size: String
}

