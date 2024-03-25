//
//  ProductRepository.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

protocol ProductRepository {
    func getProductList(_ title: String) async -> Result<[Product], ProductDomainError>
    func getProduct(byId id: String) async -> Result<ProductDetail,ProductDomainError>
}

