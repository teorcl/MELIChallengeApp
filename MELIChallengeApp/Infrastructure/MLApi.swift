//
//  MLApi.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import Foundation

enum MLApi {
    case baseURL
    
    var rawValue: String {
        switch self {
        case .baseURL:
            return "https://api.mercadolibre.com/"
        }
    }
}
