//
//  Equatable.swift
//  MELIChallengeAppTests
//
//  Created by Teodoro Calle Lara on 26/03/24.
//

import Foundation
@testable import MELIChallengeApp

extension Product: Equatable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.thumbnail == rhs.thumbnail
        && lhs.price == rhs.price
    }
}

extension ProductDetail: Equatable {
    public static func == (lhs: ProductDetail, rhs: ProductDetail) -> Bool {
        return lhs.condition == rhs.condition
        && lhs.currencyId == rhs.currencyId
        && lhs.title == rhs.title
        && lhs.price == rhs.price
        && lhs.initialQuantity == rhs.initialQuantity
        && lhs.status == rhs.status
        && lhs.pictures == rhs.pictures
    }
}

extension ProductDetail.Picture: Equatable {
    public static func == (lhs: ProductDetail.Picture, rhs: ProductDetail.Picture) -> Bool {
        return lhs.url == rhs.url && lhs.secureUrl == rhs.secureUrl
    }
}
