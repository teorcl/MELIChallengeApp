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
    let thumbnail: String
    let price: Double
    
    private enum CodingKeys: String, CodingKey {
        case id, title, thumbnail, price
    }
}

struct ResultsDTO: Codable {
    let results: [ProductDTO]
}
