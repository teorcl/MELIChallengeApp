//
//  ProductListPresentableItem.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 25/03/24.
//

import Foundation

struct ProductListPresentableItem {
    let id: String
    let title: String
    let thumbnail: String
    let price: String
    
    init(domainModel: Product){
        self.id = domainModel.id
        self.title = domainModel.title
        self.thumbnail = ProductListPresentableItem.convertHTTPToHTTPS(urlString: domainModel.thumbnail) ?? "https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg"
        self.price = "$ \(domainModel.price)"
        
    }
    
    static func convertHTTPToHTTPS(urlString: String) -> String? {
        if var urlComponents = URLComponents(string: urlString) {
            urlComponents.scheme = "https"
            return urlComponents.string
        }
        return nil
    }
    
}
