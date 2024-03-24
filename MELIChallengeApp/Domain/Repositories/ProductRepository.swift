//
//  ProductRepository.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

protocol ProductRepository {
    func getProductList(_ title: String) async -> Result<[Product], ProductDomainError>
    // Poner el de obtener la imagen
}

