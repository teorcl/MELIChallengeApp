//
//  ProductBuilder.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

class ProductBuilder {
    
    let id: String
    let title: String
    let condition: String
    let thumbnail: String
    let price: Double
    let availableQuantity: Int
    let installments: Installments
    var pictures: [Picture] = []
    
    init(
        id: String,
        title: String,
        condition: String,
        thumbnail: String,
        price: Double,
        availableQuantity: Int,
        installments: Installments
    ) {
        self.id = id
        self.title = title
        self.condition = condition
        self.thumbnail = thumbnail
        self.price = price
        self.availableQuantity = availableQuantity
        self.installments = installments
    }
    
    func addPictures(imagesData: PicturesDTO) -> ProductBuilder {
        let images = imagesData.pictures.map { pictureDTO in
            return Picture(url: pictureDTO.url, size: pictureDTO.size)
        }
        self.pictures = images
        return self
    }
    
    func build() -> Product? {
        return Product(
            id: id,
            title: title,
            condition: condition,
            thumbnail: thumbnail,
            price: price,
            availableQuantity: availableQuantity,
            installments: installments,
            pictures: pictures
        )
    }
}
