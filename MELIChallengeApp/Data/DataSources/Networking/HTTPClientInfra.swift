//
//  HTTPClientInfra.swift
//  MELIChallengeApp
//
//  Created by Teodoro Calle Lara on 24/03/24.
//

import Foundation
protocol HTTPClientInfra {
    func makeRequest(urlBase: String, endpoint: Endpoint) async -> Result<Data, HTTPClientError>
}
