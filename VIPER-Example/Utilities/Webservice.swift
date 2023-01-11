//
//  Webservice.swift
//  VIPER-Example
//
//  Created by cleanmac on 10/01/23.
//

import Foundation

final class Webservice {
    static let shared = Webservice()
    
    private init() {}
    
    func request<T: Decodable>(endpoint: String, type: T.Type) async throws -> T {
        guard let url = URL(string: endpoint) else { throw NSError(domain: "URL is invalid", code: 400) }
        let task = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(type.self, from: task.0)
        return decodedData
    }
}
