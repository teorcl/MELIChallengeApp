//
//  PictureDTO.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 23/03/24.
//

import Foundation

struct PictureDTO: Codable {
    let url: String
    let size: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case size
    }
}

struct PicturesDTO: Codable {
    let pictures: [PictureDTO]
}
