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
    let thumbnail: String
    let price, availableQuantity: Int
    let installments: Installments
}

// MARK: - Installments
struct Installments {
    let quantity: Int
    let amount: Int
    let currencyID: String
}

