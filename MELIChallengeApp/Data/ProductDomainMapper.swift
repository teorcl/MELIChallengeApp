//
//  ProductDomainMapper.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

class ProductDomainMapper {
    func map(data: ResultsDTO) -> [Product] {
        
        let productList = data.results.map { dataDTO in
            return ProductBuilder(
                id: dataDTO.id,
                title: dataDTO.title,
                condition: dataDTO.condition,
                thumbnail: dataDTO.thumbnail,
                price: dataDTO.price,
                availableQuantity: dataDTO.availableQuantity,
                installments: dataDTO.installments ?? Installments(quantity: 0, amount: 0, currencyId: "COP")
            )
        }
        
        return productList.compactMap({ productBuilder in
            return productBuilder.build()
        })
    }
}
